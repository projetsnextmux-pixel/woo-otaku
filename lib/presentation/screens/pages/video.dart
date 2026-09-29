// video_picker_page.dart
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:woo/presentation/screens/pages/upload_video.dart';
import 'package:photo_manager/photo_manager.dart';


class VideoPickerPage extends StatefulWidget {
  const VideoPickerPage({super.key});

  @override
  State<VideoPickerPage> createState() => _VideoPickerPageState();
}

class _VideoPickerPageState extends State<VideoPickerPage> {
  String _currentFolder = 'Tous les médias';
  List<AssetPathEntity> _albums = [];
  List<AssetEntity> _assets = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _initGallery();
  }

  Future<void> _initGallery() async {
    final ps = await PhotoManager.requestPermissionExtend();
    if (!ps.isAuth) {
      setState(() => _loading = false);
      return;
    }
    // Alb​um “Tous les médias” (vidéos)
    final all = (await PhotoManager.getAssetPathList(
      onlyAll: true,
      type: RequestType.video,
    )).first;
    final others = await PhotoManager.getAssetPathList(
      onlyAll: false,
      type: RequestType.video,
    );
    setState(() => _albums = [all, ...others]);
    await _loadAlbum(all);
  }

  Future<void> _loadAlbum(AssetPathEntity album) async {
    setState(() => _loading = true);
    final media = await album.getAssetListPaged(page: 0, size: 100);
    setState(() {
      _assets = media;
      _currentFolder = album.name;
      _loading = false;
    });
  }

  void _showFolderSelector() {
    showModalBottomSheet(
      context: context,
      builder: (_) => SizedBox(
        height: 300,
        child: ListView(
          children: _albums.map((album) {
            return ListTile(
              title: Text(album.name),
              subtitle: FutureBuilder<int>(
                future: album.assetCountAsync,
                builder: (_, snap) =>
                    Text(snap.hasData ? '${snap.data} fichiers' : '…'),
              ),
              onTap: () {
                Navigator.pop(context);
                _loadAlbum(album);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
        final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
    
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color:colorScheme.onSurface),
              onPressed: () => Navigator.pop(context),
            ),
            centerTitle: true,
            title: GestureDetector(
              onTap: _showFolderSelector,
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Text(_currentFolder,
                    style:
                         TextStyle(color: colorScheme.primary, fontSize: 16)),
                const Icon(Icons.arrow_drop_down, color: Colors.black),
              ]),
            ),
          ),
          Container(height: 1, color: Colors.grey.shade300),
        ]),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _assets.isEmpty
              ? const Center(child: Text('Aucune vidéo trouvée'))
              : GridView.builder(
                  padding: const EdgeInsets.all(4),
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4),
                  itemCount: _assets.length,
                  itemBuilder: (ctx, i) {
                    return FutureBuilder<Uint8List?>(
                      future: _assets[i]
                          .thumbnailDataWithSize(const ThumbnailSize(200, 200)),
                      builder: (_, snap) {
                        if (snap.connectionState == ConnectionState.done &&
                            snap.hasData) {
                          return GestureDetector(
                            onTap: () async {
                              final file = await _assets[i].file;
                              if (!context.mounted) return;
                              if (file != null) {
                                // Dès qu’on a le chemin, on navigue vers la page d’upload
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => UploadVideo(
                                      videoPath: file.path,
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.memory(snap.data!, fit: BoxFit.cover),
                                 Center(
                                  child: Icon(Icons.play_circle_fill,
                                      size: 40, color: colorScheme.surface),
                                ),
                              ],
                            ),
                          );
                        }
                        return Container(color: Colors.grey.shade200);
                      },
                    );
                  },
                ),
    );
  }
}
