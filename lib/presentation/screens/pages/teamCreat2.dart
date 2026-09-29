
import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'package:photo_manager/photo_manager.dart';

class TeamGalleryPage extends StatefulWidget {
  const TeamGalleryPage({super.key});
  @override
  State<TeamGalleryPage> createState() => _TeamGalleryPageState();
}

class _TeamGalleryPageState extends State<TeamGalleryPage> {
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
    // Demande de permission photo_manager
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    if (!ps.isAuth) {
      // permission refusée -> on quitte
      setState(() => _loading = false);
      return;
    }

    // Récupération de l'album "Tous les médias"
    final all = (await PhotoManager.getAssetPathList(
      onlyAll: true,
      type: RequestType.image,
    )).first;

    // Récupération des autres albums
    final others = await PhotoManager.getAssetPathList(
      onlyAll: false,
      type: RequestType.image,
    );

    setState(() {
      _albums = [all, ...others];
    });

    // Charge les 100 premiers assets
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
                builder: (_, snap) => Text(
                  snap.hasData ? '${snap.data}  fichiers' : '…',
                ),
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            centerTitle: true,
            title: GestureDetector(
              onTap: _showFolderSelector,
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Text(_currentFolder,
                    style:
                        const TextStyle(color: Colors.black, fontSize: 16)),
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
              ? const Center(child: Text('Aucun média trouvé'))
              : GridView.builder(
                  padding: const EdgeInsets.all(4),
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, crossAxisSpacing: 4, mainAxisSpacing: 4),
                  itemCount: _assets.length,
                  itemBuilder: (context, i) {
                    return FutureBuilder<Uint8List?>(
                      future: _assets[i]
                          .thumbnailDataWithSize(const ThumbnailSize(200, 200)),
                      builder: (ctx, snap) {
                        if (snap.connectionState == ConnectionState.done &&
                            snap.hasData) {
                          return GestureDetector(
                            onTap: () async {
                              final file = await _assets[i].file;
                              if (!context.mounted) return;
                              if (file != null) {
                                Navigator.pop(context, file.path);
                              }
                            },
                            child: Image.memory(snap.data!, fit: BoxFit.cover),
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
