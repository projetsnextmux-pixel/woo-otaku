import 'package:flutter/material.dart';
import 'package:woo/core/services/auth_service.dart';
import 'package:woo/core/services/rank_quest_service.dart';
import 'package:woo/core/widgets/bottom_navigation.dart';
import 'package:woo/core/widgets/button.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/core/widgets/hamburger.dart';
import 'package:woo/data/models/user.dart';

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
  final int _selectedIndex = 4;
  late TabController _tabController;

  User? _currentUser;
  Map<String, dynamic>? _rankData;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    try {
      final user = await AuthService.getMe();
      final rankRes = await RankQuestService.getMyRankProgress();

      if (mounted) {
        setState(() {
          _currentUser = user;
          _rankData = rankRes['data'];
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _currentUser = User.sessionUser;
        });
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Widget> get _pages => [
    NewsPage(),
    ChatTeamPage(),
    CreatePage(),
    NotifiPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    if (index != 4) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => _pages[index]));
    }
  }

  @override
  Widget build(BuildContext context) {
    final pseudo = _currentUser?.pseudo ?? 'Otaku';
    final rank = _currentUser?.rank ?? 'F-';
    final totalUe = _currentUser?.totalUe ?? 0;

    final progressPct = (_rankData?['progress_percentage'] ?? 0.0) / 100.0;
    final nextRank = _rankData?['next_rank'] ?? 'F';
    final ueRemaining = _rankData?['ue_remaining'] ?? 50;

    return Scaffold(
      extendBodyBehindAppBar: true,
      endDrawer: Hamburger(
        backColor: Colors.grey.shade300,
        texteColor: Colors.black,
        borderRadius: BorderRadius.circular(0),
        onTap: () {},
        version: 'v1.0 (WooVerse Bêta)',
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    pseudo,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Rang $rank',
                      style: const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              background: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
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
                  padding: const EdgeInsets.all(12),
                  color: Colors.black87,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '⚡ UE Totales: $totalUe UE',
                            style: const TextStyle(color: Colors.yellowAccent, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Prochain Rang: $nextRank ($ueRemaining UE)',
                            style: const TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: progressPct.clamp(0.0, 1.0),
                          minHeight: 8,
                          backgroundColor: Colors.white24,
                          valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.black,
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: AppColors.primary,
                    labelColor: AppColors.white,
                    unselectedLabelColor: Colors.white,
                    tabs: const [
                      Tab(
                        child: Column(children: [
                          Text('0', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                          Text('Abonnés')
                        ]),
                      ),
                      Tab(
                        child: Column(children: [
                          Text('0', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                          Text('Publications')
                        ]),
                      ),
                      Tab(
                        child: Column(children: [
                          Text('0', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                          Text('Abonnements')
                        ]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(width: 50),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primary, width: 2),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.link, color: AppColors.primary),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LinkPage()));
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
                        border: Border.all(color: AppColors.primary, width: 2),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.favorite_rounded, color: AppColors.primary),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const MyFavory()));
                        },
                      ),
                    ),
                    const SizedBox(width: 50),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  _currentUser?.bio ?? 'Bienvenue dans le WooVerse !',
                  style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                ),
                const Divider(),
              ],
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: const [
                Center(child: Text('Aucun abonné pour le moment')),
                Center(child: Text('Aucune publication')),
                Center(child: Text('Aucun abonnement')),
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