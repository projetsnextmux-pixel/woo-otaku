// create_page.dart

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:image_picker/image_picker.dart';

import 'package:woo/core/widgets/button.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/presentation/screens/pages/create_news2.dart';
import 'package:woo/presentation/screens/pages/video.dart';
import 'package:woo/presentation/screens/pages/wooming_creat.dart';

class CarouselItem {
  final String imagePath;
  final String text;
  CarouselItem(this.imagePath, this.text);
}

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  int _selectedTabIndex = 0;
  int _currentCarouselPage = 0;
  late PageController _carouselController;
  final ImagePicker _picker = ImagePicker();

  // Images tabs assets
  final List<String> tabImages = [
    "images/Groupe 1915.png",
    "images/Groupe 1913 (1).png",
    "images/Groupe 1406.png",
  ];

  final List<CarouselItem> carouselItems = [
    CarouselItem(
      'images/Groupe 1723.png',
      "Avec Wooming tu peux faire des vidéos en live\net partager des contenus avec tes amis",
    ),
    CarouselItem(
      'images/Groupe 1724 (1).png',
      "Tu peux aussi faire du streaming de tes parties de gaming",
    ),
    CarouselItem(
      'images/n5.png',
      "Et tu peux partager des épisodes d'animés avec tes amis",
    ),
  ];

  // ===== photo manager state for images =====
  List<AssetPathEntity> _albums = [];
  List<AssetEntity> _assets = [];
  bool _loadingGallery = true;
  AssetPathEntity? _currentAlbum;

  // ===== video collections =====
  List<AssetPathEntity> _videoAlbums = [];
  List<AssetEntity> _videoAssets = [];
  bool _loadingVideos = false;
  AssetPathEntity? _currentVideoAlbum;

  @override
  void initState() {
    super.initState();
    _carouselController = PageController();
    _initGallery(); // load phone images initially
  }

  @override
  void dispose() {
    _carouselController.dispose();
    super.dispose();
  }

  /// ---------- Photo init ----------
  Future<void> _initGallery() async {
    setState(() => _loadingGallery = true);
    final PermissionState permission =
        await PhotoManager.requestPermissionExtend();
    if (!permission.isAuth) {
      setState(() => _loadingGallery = false);
      return;
    }

    final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      onlyAll: false,
    );

    final all =
        (await PhotoManager.getAssetPathList(
          onlyAll: true,
          type: RequestType.image,
        )).first;
    setState(() {
      _albums = [all, ...paths.where((p) => p.id != all.id).toList()];
      _currentAlbum = all;
    });
    await _loadAlbum(_currentAlbum!);
  }

  Future<void> _loadAlbum(AssetPathEntity album) async {
    setState(() {
      _loadingGallery = true;
      _currentAlbum = album;
    });
    final media = await album.getAssetListPaged(page: 0, size: 200);
    setState(() {
      _assets = media;
      _loadingGallery = false;
    });
  }

  void _showFolderSelector() {
    showModalBottomSheet(
      context: context,
      builder:
          (_) => Container(
            height: 360,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Albums',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _albums.length,
                    itemBuilder: (_, i) {
                      final a = _albums[i];
                      return ListTile(
                        title: Text(a.name),
                        subtitle: FutureBuilder<int>(
                          future: a.assetCountAsync,
                          builder:
                              (_, snap) => Text(
                                snap.hasData ? '${snap.data} fichiers' : '…',
                              ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          _loadAlbum(a);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
    );
  }

  /// ---------- Video init ----------
  Future<void> _initVideoGallery() async {
    setState(() => _loadingVideos = true);
    final PermissionState permission =
        await PhotoManager.requestPermissionExtend();
    if (!permission.isAuth) {
      setState(() => _loadingVideos = false);
      return;
    }

    final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList(
      type: RequestType.video,
      onlyAll: false,
    );

    final all =
        (await PhotoManager.getAssetPathList(
          onlyAll: true,
          type: RequestType.video,
        )).first;
    setState(() {
      _videoAlbums = [all, ...paths.where((p) => p.id != all.id).toList()];
      _currentVideoAlbum = all;
    });
    await _loadVideoAlbum(_currentVideoAlbum!);
  }

  Future<void> _loadVideoAlbum(AssetPathEntity album) async {
    setState(() {
      _loadingVideos = true;
      _currentVideoAlbum = album;
    });
    final media = await album.getAssetListPaged(page: 0, size: 200);
    setState(() {
      _videoAssets = media;
      _loadingVideos = false;
    });
  }

  void _showVideoFolderSelector() {
    showModalBottomSheet(
      context: context,
      builder:
          (_) => Container(
            height: 360,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Albums vidéos',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _videoAlbums.length,
                    itemBuilder: (_, i) {
                      final a = _videoAlbums[i];
                      return ListTile(
                        title: Text(a.name),
                        subtitle: FutureBuilder<int>(
                          future: a.assetCountAsync,
                          builder:
                              (_, snap) => Text(
                                snap.hasData ? '${snap.data} fichiers' : '…',
                              ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          _loadVideoAlbum(a);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
    );
  }

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
      if (index != 2) {
        _currentCarouselPage = 0;
        if (_carouselController.hasClients) _carouselController.jumpToPage(0);
      }
    });

    // lazy-load videos when user switches to video tab
    if (index == 1 && _videoAssets.isEmpty) {
      _initVideoGallery();
    }
  }

  void _handleCarouselNavigation() {
    if (!_carouselController.hasClients) return;
    if (_currentCarouselPage < 2) {
      _carouselController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (_) => CreatePage2()));
    }
  }

  // Take a photo (existing)
  Future<void> _takePhoto() async {
    try {
      final XFile? photo = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1200,
        maxHeight: 1200,
        imageQuality: 80,
      );
      if (photo != null) {
        Navigator.pop(context, photo.path);
      }
    } catch (e) {
      debugPrint("Erreur prise de photo: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erreur lors de la prise de photo")),
      );
    }
  }

  // Record a video via camera
  Future<void> _recordVideo() async {
    try {
      final XFile? video = await _picker.pickVideo(
        source: ImageSource.camera,
        maxDuration: Duration(minutes: 5),
      );
      if (video != null) {
        Navigator.pop(context, video.path);
      }
    } catch (e) {
      debugPrint("Erreur enregistrement vidéo: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erreur lors de l'enregistrement vidéo")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorScheme.onSurface),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Ajouter une nouvelle publication",
          style: TextStyle(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(color: Colors.grey.shade500, height: 1),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),

          // tabs row
          Row(
            children: List.generate(3, (i) {
              final titles = [
                "Ajouter des photos",
                "Ajouter une vidéo",
                "Créer un wooming",
              ];
              final isSelected = _selectedTabIndex == i;
              return Expanded(
                child: GestureDetector(
                  onTap: () => _onTabSelected(i),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor:
                            isSelected
                                ? AppColors.primary
                                : Colors.grey.shade300,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              isSelected ? Colors.white : Colors.grey,
                              BlendMode.srcIn,
                            ),
                            child: Image.asset(
                              tabImages[i],
                              width: 30,
                              height: 30,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: width / 3 * 0.9,
                        child: Text(
                          titles[i],
                          textAlign: TextAlign.center,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 10),

          // indicator bar
          Row(
            children: List.generate(
              3,
              (i) => Container(
                height: _selectedTabIndex == i ? 5 : 3,
                width: width / 3,
                color:
                    _selectedTabIndex == i
                        ? AppColors.primary
                        : Colors.grey.shade300,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // album selector for photos / videos
          if (_selectedTabIndex == 0)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: _showFolderSelector,
                    child: Row(
                      children: [
                        Icon(Icons.folder_open, color: Colors.black54),
                        const SizedBox(width: 8),
                        Text(
                          _currentAlbum?.name ?? 'Tous les médias',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Icon(Icons.arrow_drop_down, color: Colors.black54),
                      ],
                    ),
                  ),
                  Spacer(),
                  TextButton.icon(
                    onPressed: _initGallery,
                    icon: Icon(Icons.refresh),
                    label: Text('Rafraîchir'),
                  ),
                ],
              ),
            ),

          if (_selectedTabIndex == 1)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: _showVideoFolderSelector,
                    child: Row(
                      children: [
                        Icon(Icons.folder_open, color: Colors.black54),
                        const SizedBox(width: 8),
                        Text(
                          _currentVideoAlbum?.name ?? 'Toutes les vidéos',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Icon(Icons.arrow_drop_down, color: Colors.black54),
                      ],
                    ),
                  ),
                  Spacer(),
                  TextButton.icon(
                    onPressed: _initVideoGallery,
                    icon: Icon(Icons.refresh),
                    label: Text('Rafraîchir'),
                  ),
                ],
              ),
            ),

          const SizedBox(height: 12),

          // content area
          Expanded(
            child:
                _selectedTabIndex == 0
                    ? _buildPhotoGrid()
                    : _selectedTabIndex == 1
                    ? _buildVideoGrid()
                    : _buildWoomingInfo(),
          ),
        ],
      ),
    );
  }

  /// ---------------- photos grid (unchanged behavior) ----------------
  Widget _buildPhotoGrid() {


    if (_loadingGallery) return Center(child: CircularProgressIndicator());

    if (_assets.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildCameraButton(),
            const SizedBox(height: 12),
            Text(
              'Aucune photo trouvée',
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      );
    }

    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: EdgeInsets.all(8),
      itemCount: _assets.length + 1,
      itemBuilder: (ctx, idx) {
        if (idx == 0) return _buildCameraButton();
        final asset = _assets[idx - 1];
        return FutureBuilder<Uint8List?>(
          future: asset.thumbnailDataWithSize(
            ThumbnailSize(600, 600),
            quality: 80,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return GestureDetector(
                onTap: () async {
                  final file = await asset.file;
                  if (file != null) {
                    Navigator.pop(context, file.path);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Impossible de récupérer le fichier'),
                      ),
                    );
                  }
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.memory(snapshot.data!, fit: BoxFit.cover),
                ),
              );
            }
            return Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
            );
          },
        );
      },
    );
  }

  /// ---------------- videos grid (le bouton DEFILE avec la liste) ----------------
  Widget _buildVideoGrid() {


    if (_loadingVideos) return Center(child: CircularProgressIndicator());

    // si pas de vidéos -> afficher bouton centré (cas spécial)
    if (_videoAssets.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildRecordButton(),
            const SizedBox(height: 12),
            Text(
              'Aucune vidéo trouvée',
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      );
    }

    // ListView qui contient le bouton comme premier item => il défile avec la liste
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: _videoAssets.length + 1, // +1 pour le bouton d'enregistrement
      itemBuilder: (ctx, idx) {
        if (idx == 0) {
          // premier item : bouton d'enregistrement (va défiler)
          return Container(
            margin: EdgeInsets.only(bottom: 12),
            child: GestureDetector(
              onTap: _recordVideo,
              child: Container(
                padding: EdgeInsets.all(10),
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade500,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.videocam_outlined,
                      size: 40,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Enregistrer une vidéo",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        final asset = _videoAssets[idx - 1];
        return FutureBuilder<Uint8List?>(
          future: asset.thumbnailDataWithSize(
            const ThumbnailSize(800, 450),
            quality: 80,
          ),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.done && snap.hasData) {
              // prise en charge sûre de la durée (int / Duration / autre)
              final dynamic dyn = asset.duration;
              int seconds = 0;
              if (dyn is int) {
                seconds = dyn;
              } else if (dyn is Duration) {
                seconds = dyn.inSeconds;
              } else if (dyn != null) {
                seconds = int.tryParse(dyn.toString()) ?? 0;
              }
              String formattedDuration() {
                if (seconds <= 0) return '';
                final minutes = seconds ~/ 60;
                final sec = seconds % 60;
                String two(int n) => n.toString().padLeft(2, '0');
                return '${two(minutes)}:${two(sec)}';
              }

              return GestureDetector(
                onTap: () async {
                  final file = await asset.file;
                  if (file != null) {
                    Navigator.pop(context, file.path);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Impossible de récupérer le fichier vidéo',
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 12),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.memory(snap.data!, fit: BoxFit.cover),
                        Container(color: Colors.black26),
                        Center(
                          child: Icon(
                            Icons.play_circle_fill,
                            size: 56,
                            color: Colors.white70,
                          ),
                        ),
                        if (seconds > 0)
                          Positioned(
                            right: 10,
                            bottom: 10,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                formattedDuration(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            }

            return Container(
              margin: EdgeInsets.only(bottom: 12),
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildRecordButton() {
    return GestureDetector(
      onTap: _recordVideo,
      child: Container(
        padding: EdgeInsets.all(10),
        height: 140,
        decoration: BoxDecoration(
          color: Colors.grey.shade500,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.videocam, size: 40, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              "Enregistrer une vidéo",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWoomingInfo() {
        final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _carouselController,
              itemCount: 4,
              onPageChanged:
                  (page) => setState(() => _currentCarouselPage = page),
              itemBuilder: (ctx, idx) {
                if (idx < 3) {
                  final item = carouselItems[idx];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(item.imagePath, height: 150),
                      const SizedBox(height: 20),
                      Text(
                        item.text,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildWoomingActionButton(
                        icon: Icons.videocam_outlined,
                        label: "Enregistrer un wooming maintenant",
                        onTap:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => WoomingCreat()),
                            ),
                      ),
                      const SizedBox(height: 16),
                      _buildWoomingActionButton(
                        icon: Icons.video_call_outlined,
                        label: "Programmer un wooming",
                        onTap:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => WoomingCreat()),
                            ),
                      ),
                      const SizedBox(height: 16),
                      _buildWoomingActionButton(
                        icon: Icons.video_library,
                        label: "Programmer la mise en ligne d'une vidéo",
                        onTap:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => VideoPickerPage(),
                              ),
                            ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 20),
          if (_currentCarouselPage < 3)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Button(
                name: _currentCarouselPage == 2 ? "Commencer" : "Suivant",
                buttonColor: AppColors.primary,
                buttonTextColor: colorScheme.surface,
                buttonWidth: double.infinity,
                buttonFonSize: 15,
                borderbuttonColor: AppColors.white,
                onTap: _handleCarouselNavigation,
              ),
            ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildWoomingActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.primary, size: 50),
            const SizedBox(height: 12),
            Container(
              width: 200,
              child: Text(
                label,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCameraButton() {
    return GestureDetector(
      onTap: _takePhoto,
      child: Container(
        padding: EdgeInsets.all(10),
        height: 140,
        decoration: BoxDecoration(
          color: Colors.grey.shade500,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.camera_alt_outlined, size: 40, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              "Utiliser la caméra",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
