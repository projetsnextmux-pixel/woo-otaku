import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:woo/core/widgets/bottom_navigation.dart';
import 'package:woo/core/widgets/button.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/core/widgets/hamburger.dart';

import 'package:woo/presentation/screens/pages/chatTeam.dart';
import 'package:woo/presentation/screens/pages/create_news.dart';
import 'package:woo/presentation/screens/pages/link_page.dart';
import 'package:woo/presentation/screens/pages/myfavory.dart';
import 'package:woo/presentation/screens/pages/news.dart';
import 'package:woo/presentation/screens/pages/notification.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 4; // L'index initial est 4 pour afficher ProfilePage
  late TabController _tabController;

  // Liste d'exemple pour les abonnés
  final List<Map<String, dynamic>> abonnes = [
  {"pseudo": "pseudo1", "abonne": true},
  {"pseudo": "pseudo2", "abonne": true},
  {"pseudo": "pseudo3", "abonne": false},
  {"pseudo": "pseudo4", "abonne": false},
  {"pseudo": "pseudo5", "abonne": false},
  {"pseudo": "pseudo6", "abonne": false},
]
;

  final List<Map<String, dynamic>> abonnements = [
  {"pseudo": "pseudo1", "abonne": true},
  {"pseudo": "pseudo2", "abonne": true},
  {"pseudo": "pseudo3", "abonne": true},
  {"pseudo": "pseudo4", "abonne": true},
  {"pseudo": "pseudo5", "abonne": true},
  {"pseudo": "pseudo6", "abonne": true},
  {"pseudo": "pseudo7", "abonne": true},
  {"pseudo": "pseudo8", "abonne": true},
  {"pseudo": "pseudo9", "abonne": true},
  {"pseudo": "pseudo10", "abonne": true},
  {"pseudo": "pseudo11", "abonne": true},
  {"pseudo": "pseudo12", "abonne": true},
  {"pseudo": "pseudo13", "abonne": true},
  {"pseudo": "pseudo14", "abonne": true},
  {"pseudo": "pseudo15", "abonne": true},
];

  final List<Map<String, dynamic>> posts = [
    {
      "imagePath": AssetImage("images/5bd5fc17416c01761655b8e5335c6f03.jpg"),
      "isPinned": true
    },
    {"imagePath": AssetImage("images/animes.jpeg"), "isPinned": false},
    {"imagePath": AssetImage("images/n1.png"), "isPinned": false},
    {"imagePath": AssetImage("images/n2.png"), "isPinned": false},
    {"imagePath": AssetImage("images/n3.png"), "isPinned": false},
    {"imagePath": AssetImage("images/n4.png"), "isPinned": true},
    {
      "imagePath": AssetImage("images/5bd5fc17416c01761655b8e5335c6f03.jpg"),
      "isPinned": false
    },
    {"imagePath": AssetImage("images/animes.jpeg"), "isPinned": false},
    {"imagePath": AssetImage("images/animes.jpeg"), "isPinned": false},
    {"imagePath": AssetImage("images/animes.jpeg"), "isPinned": false},
    {"imagePath": AssetImage("images/animes.jpeg"), "isPinned": false},
    {"imagePath": AssetImage("images/animes.jpeg"), "isPinned": false},
    {"imagePath": AssetImage("images/animes.jpeg"), "isPinned": false},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<Widget> _pages = [
    NewsPage(),
    ChatTeamPage(),
    CreatePage(),
    NotifiPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => _pages[index]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      endDrawer: Hamburger(
        backColor: Colors.grey.shade300,
        texteColor: Colors.black,
        borderRadius: BorderRadius.circular(0),
        onTap: () {
        debugPrint('Option sélectionnée');
        },
        version: 'v18665465151d',
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Pseudo',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              background: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/animes.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
                children: [
                  Container(
                    color: Colors.black,
                    child: TabBar(
                      controller: _tabController,
                      indicatorColor: AppColors.primary,
                      labelColor: AppColors.white,
                      unselectedLabelColor: Colors.white,
                      tabs: [
                        Tab(
                          child: Column(children: [
                            Text(
                              '23K',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Abonnés')
                          ]),
                        ),
                        Tab(
                          child: Column(children: [
                            Text(
                              '456',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Publications')
                          ]),
                        ),
                        Tab(
                          child: Column(children: [
                            Text(
                              '22K',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Abonnements')
                          ]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(width: 50),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: AppColors.primary, width: 2),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.link, color: AppColors.primary),
                          onPressed: () {
                            // Action pour le bouton de partage
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LinkPage()),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Button(
                          name: 'Modifier le profil',
                          buttonColor: AppColors.primary,
                          buttonTextColor: Colors.white,
                          buttonFonSize: 15,
                          borderbuttonColor: AppColors.white,
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: AppColors.primary, width: 2),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.favorite_rounded,
                              color: AppColors.primary),
                          onPressed: () {
                            // Action pour le bouton des paramètres
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyFavory()),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 50),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Biographie',
                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                  ),
                  Divider(),
                ],
              ),
            ),
          SliverFillRemaining(
            child: TabBarView(
                controller: _tabController,
                children: [
                  // Onglet Abonnés
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: ListView.builder(
                      itemCount: abonnes.length,
                      itemBuilder: (context, index) {
                        final abonne = abonnes[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(
                                "images/animes.jpeg"), // Remplacez avec votre chemin d'image
                          ),
                          title: Row(
                            children: [
                              Text(
                                abonne['pseudo'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              if (abonne['abonne']) // Ajout de l'icône vérifiée
                                Icon(
                                  Icons.check_circle,
                                  color: AppColors.primary,
                                  size: 16,
                                ),
                            ],
                          ),
                          subtitle: Text('@${abonne['pseudo']}'),
                          trailing: Button(
                            name: abonne['abonne']
                                ? 'Se désabonner'
                                : 'S\'abonner',
                            buttonColor: abonne['abonne']
                                ? Colors.transparent
                                : AppColors.primary, // Couleur du bouton
                            buttonTextColor: abonne['abonne']
                                ? AppColors.primary
                                : Colors.white, // Couleur du texte
                            buttonFonSize: 15, // Taille du texte
                            borderbuttonColor:
                                AppColors.primary, // Couleur de la bordure
                            isTransparent:
                                abonne['abonne'], // Gestion de la transparence
                            onTap: () {
                              // Logique pour abonner/désabonner
                              setState(() {
                                abonne['abonne'] = !abonne['abonne'];
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),

                  // Onglet Publications
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MasonryGridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate:
                          SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        final post = posts[index];
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Stack(
                            children: [
                              ClipRRect(
                                child: Image(
                                  image: post["imagePath"],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              if (post["isPinned"] == true)
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: AppColors.primary.withValues(alpha: 0.8),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Icon(
                                      Icons.push_pin,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  // Onglet Abonnements
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: ListView.builder(
                      itemCount: abonnements.length,
                      itemBuilder: (context, index) {
                        final abonnement = abonnements[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(
                                "images/animes.jpeg"), // Remplacez avec votre chemin d'image
                          ),
                          title: Row(
                            children: [
                              Text(
                                abonnement['pseudo'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              if (abonnement[
                                  'abonne']) // Ajout de l'icône vérifiée
                                Icon(
                                  Icons.check_circle,
                                  color: AppColors.primary,
                                  size: 16,
                                ),
                            ],
                          ),
                          subtitle: Text('@${abonnement['pseudo']}'),
                          trailing: Button(
                            name: abonnement['abonne']
                                ? 'Se désabonner'
                                : 'S\'abonner',
                            buttonColor: abonnement['abonne']
                                ? Colors.transparent
                                : AppColors.primary, // Couleur du bouton
                            buttonTextColor: abonnement['abonne']
                                ? AppColors.primary
                                : Colors.white, // Couleur du texte
                            buttonFonSize: 15, // Taille du texte
                            borderbuttonColor:
                                AppColors.primary, // Couleur de la bordure
                            isTransparent: abonnement[
                                'abonne'], // Gestion de la transparence
                            onTap: () {
                              if (abonnement['abonne']) {
                                // Afficher une alerte pour confirmer le désabonnement
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Confirmation"),
                                      content: Text(
                                          "Voulez-vous vraiment vous désabonner de ${abonnement['pseudo']} ?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(
                                                context); // Fermer le dialogue
                                          },
                                          child: Text("Annuler"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              abonnements.removeAt(
                                                  index); // Supprimer l'utilisateur
                                            });
                                            Navigator.pop(
                                                context); // Fermer le dialogue
                                            // Optionnel : Ajouter une notification contextuelle
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    "Vous vous êtes désabonné de ${abonnement['pseudo']}"),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            "Confirmer",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                setState(() {
                                  abonnement['abonne'] =
                                      true; // Réabonner si nécessaire
                                });
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
