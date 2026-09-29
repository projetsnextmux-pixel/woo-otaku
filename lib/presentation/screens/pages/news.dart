import 'package:flutter/material.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/core/widgets/popUp.dart';
import 'package:woo/core/widgets/publication.dart';
import 'package:woo/core/widgets/bottom_navigation.dart';
import 'package:woo/core/widgets/video_player.dart';
import 'package:woo/presentation/screens/pages/add_wooming.dart';

import 'package:woo/presentation/screens/pages/chatTeam.dart';
import 'package:woo/presentation/screens/pages/create_news.dart';
import 'package:woo/presentation/screens/pages/notification.dart';
import 'package:woo/presentation/screens/pages/profile.dart'; // Importez le widget de la barre de navigation
import 'package:flutter_svg/flutter_svg.dart';
import 'package:woo/presentation/screens/pages/search.dart';

import 'package:woo/presentation/screens/pages/wooming_detail.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});
  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int _selectedIndex = 0;
  bool _isLoading = false;
  bool _hasMoreData = true;
  List<Map<String, dynamic>> posts = [];
  final ScrollController _scrollController = ScrollController();
  // Liste de données des postes
  final List<Map<String, dynamic>> allPosts = [
    {
      "username": "@animeLover",
      "timeAgo": "A l'instant",
      "postDescription": "Regardez mon dernier cosplay de Naruto!",
      "hashtags": "#cosplay #naruto #anime",
      "likes": "120",
      "comments": "30",
      "imagePath": AssetImage("images/animes.jpeg"),
    },
    {
      "username": "@otakuGirl",
      "timeAgo": "10 min",
      "postDescription": "Art digital inspiré de One Piece.",
      "hashtags": "#art #onepiece #otaku",
      "likes": "340",
      "comments": "45",
      "imagePath": "videos/naruto.MP4",
    },
    {
      "username": "@chibiQueen",
      "timeAgo": "20 min",
      "postDescription": "Chibi art que j'ai créé aujourd'hui!",
      "hashtags": "#chibi #art #kawaii",
      "likes": "410",
      "comments": "25",
      "imagePath": AssetImage("images/n3.png"),
    },
    {
      "username": "@mangaKing",
      "timeAgo": "15 min",
      "postDescription": "Découvrez mon nouveau manga préféré!",
      "hashtags": "#manga #reading #otaku",
      "likes": "280",
      "comments": "60",
      "imagePath": "videos/n3.avi",
    },
    {
      "username": "@sakuraFan",
      "timeAgo": "25 min",
      "postDescription": "Mon hommage à Sakura Haruno.",
      "hashtags": "#naruto #sakura #fanart",
      "likes": "500",
      "comments": "80",
      "imagePath": "videos/n4.avi",
    },
  ];

  // Charger un nouveau lot de 4 éléments
  void _loadMorePosts() {
    if (_isLoading || !_hasMoreData) return;

    setState(() {
      _isLoading = true;
    });

    // Simuler une attente pour récupérer toutes les données
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        // Charge tous les posts si plus de données sont disponibles
        if (posts.length < allPosts.length) {
          posts.addAll(allPosts);
        } else {
          _hasMoreData = false; // Il n'y a plus de données à charger
        }
        _isLoading = false;
      });
    });
  }

  // Vérifier si on est proche du bas de la liste pour charger plus de contenu
  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadMorePosts();
    }
  }

  @override
  void initState() {
    super.initState();
    _loadMorePosts(); // Charger les premiers 4 posts
    _scrollController.addListener(_onScroll); // Ajouter l'écouteur de scroll
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  // Liste des pages que vous souhaitez afficher
  final List<Widget> _pages = [
    NewsPage(), // Remplacez par la page de news
    ChatTeamPage(), // Remplacez par la page de messages
    CreatePage(), // Remplacez par la page de publication
    NotifiPage(), // Remplacez par la page de notifications
    ProfilePage(), // Remplacez par la page de profil
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Ajoutez ici la logique pour la navigation si nécessaire
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _pages[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false, // Supprimer le bouton retour
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'icons/logotype_woo.svg',
              colorFilter:
                  ColorFilter.mode(AppColors.primary, BlendMode.srcIn), // si votre SVG est en outline monochrome
              width: 24,
              height: 24,
            ),
            Row(
              children: [
                // Remplacer le bouton abonnement par un bouton icône
                IconButton(
                  onPressed: () => showPopupAvecBoutonExterieur(context),
                  icon: SvgPicture.asset(
                    'icons/bouton_bascule.svg',
                    colorFilter:
                        ColorFilter.mode(AppColors.primary, BlendMode.srcIn), // si votre SVG est en outline monochrome
                    width: 24,
                    height: 24,
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchPage()),
                    );
                  },
                  icon: Icon(Icons.search_rounded, color: AppColors.primary),
                ),
              ],
            ),
          ],
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      
        children: [
          _buildWooBar(),
          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap:
                    true, // Nécessaire pour éviter l'erreur de ListView dans SingleChildScrollView
                physics:
                    NeverScrollableScrollPhysics(), // Désactive le scroll interne de ListView
                padding: EdgeInsets.all(10),
                itemCount: posts.length + 1,
                controller: _scrollController,
                itemBuilder: (context, index) {
                  if (index == posts.length) {
                    // Afficher un indicateur de chargement au bas
                    return _isLoading
                        ? Center(child: CircularProgressIndicator())
                        : SizedBox.shrink();
                  }
                  final post = posts[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Vérifiez si le chemin correspond à une vidéo
                      post["imagePath"] is String &&
                              (post["imagePath"].endsWith('.MP4') ||
                                  post["imagePath"].endsWith('.MOV') ||
                                  post["imagePath"].endsWith('.mp4') ||
                                  post["imagePath"].endsWith('.mov') ||
                                  post["imagePath"].endsWith('.AVI') ||
                                  post["imagePath"].endsWith('.avi'))
                          ? ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: double.infinity,
                            ),
                            child: LocalVideoPlayer(
                              likesCount: post["likes"],
                              commentsCount: post["comments"],
                              videoPath:
                                  post["imagePath"], // Passez le chemin de la vidéo
                            ),
                          )
                          : Publication(
                            imageUrl: post["imagePath"],
                            likesCount: post["likes"],
                            commentsCount: post["comments"],
                          ),
                      // Informations sous la carte
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  post["username"],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: colorScheme.onSurface,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  post["timeAgo"],
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Text(post["postDescription"],
                                style: TextStyle(
                                  color: colorScheme.onSurface,
                                )),
                            SizedBox(height: 5),
                            Text(
                              post["hashtags"],
                              style: TextStyle(color: AppColors.primary),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped, // Passez la fonction de callback
      ),
    );
  }

  // Dans ta classe _NewsPageState…
  Widget _buildWooBar() {
      final colorScheme = Theme.of(context).colorScheme;
    final List<Map<String, String>> woomingItems = [
      {
        'image': 'images/n1.png',
        'pseudo': '@pseudo1',
        'avatar': 'images/n1.png',
      },
      {
        'image': 'images/n2.png',
        'pseudo': '@pseudo2',
        'avatar': 'images/n2.png',
      },
      {
        'image': 'images/n3.png',
        'pseudo': '@pseudo3',
        'avatar': 'images/n3.png',
      },
      {
        'image': 'images/n4.png',
        'pseudo': '@pseudo4',
        'avatar': 'images/n4.png',
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final double barHeight = (constraints.maxHeight * 0.20).clamp(
          80.0,
          120.0,
        );
        final double imageHeight = barHeight * 0.6;
        final double itemWidth = imageHeight * (5 / 3);
        const double itemMarginRight = 10;

        return Container(
          height: barHeight,
          color:Theme.of(context).scaffoldBackgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: woomingItems.length + 1,
            itemBuilder: (context, i) {
              // 1) Bouton “+”
              if (i == 0) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => AddWoomingPage()),
                    );
                  },
                  child: Container(
                    width: itemWidth,
                    margin: const EdgeInsets.only(right: itemMarginRight),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 4),
                        Container(
                          width: itemWidth,
                          height: imageHeight,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.primary,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.add,
                            color: AppColors.primary,
                            size: imageHeight * 0.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Flexible(
                          child: Text(
                            'Ajouter un wooming',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              // 2) Vignette WOOming
              final item = woomingItems[i - 1];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      // builder: (_) => WoomingDetailPage(pseudo: item['pseudo']!),
                      builder: (_) => WoomingDetailPage(),
                    ),
                  );
                },
                child: Container(
                  width: itemWidth,
                  margin: const EdgeInsets.only(right: itemMarginRight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              item['image']!,
                              width: itemWidth,
                              height: imageHeight,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 4,
                            right: 4,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                'LIVE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: imageHeight * 0.13,
                            backgroundImage: AssetImage(item['avatar']!),
                            backgroundColor: Colors.transparent,
                          ),
                          const SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              item['pseudo']!,
                              style:  TextStyle(
                                fontSize: 12,
                                color:colorScheme.onSurface,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
