import 'package:flutter/material.dart';
import 'package:woo/core/services/feed_service.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/core/widgets/bottom_navigation.dart';
import 'package:woo/presentation/screens/pages/chatTeam.dart';
import 'package:woo/presentation/screens/pages/create_news.dart';
import 'package:woo/presentation/screens/pages/notification.dart';
import 'package:woo/presentation/screens/pages/profile.dart';
import 'package:woo/presentation/screens/pages/search.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});
  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final int _selectedIndex = 0;
  bool _isLoading = true;
  List<dynamic> _posts = [];
  int _currentPage = 1;
  bool _isExplore = false;

  @override
  void initState() {
    super.initState();
    _fetchFeed();
  }

  Future<void> _fetchFeed({bool refresh = false}) async {
    if (refresh) {
      _currentPage = 1;
      _posts.clear();
    }
    setState(() { _isLoading = true; });

    try {
      final res = _isExplore
          ? await FeedService.getExploreFeed(page: _currentPage)
          : await FeedService.getFeed(page: _currentPage);

      final dataList = res['data']['data'] as List<dynamic>? ?? [];

      if (mounted) {
        setState(() {
          _posts = refresh ? dataList : [..._posts, ...dataList];
          _isLoading = false;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() { _isLoading = false; });
      }
    }
  }

  List<Widget> get _pages => [
    NewsPage(),
    ChatTeamPage(),
    CreatePage(),
    NotifiPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    if (index != 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => _pages[index]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'WooVerse Feed',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Row(
              children: [
                ChoiceChip(
                  label: Text('Suivis', style: TextStyle(color: !_isExplore ? Colors.black : Colors.white)),
                  selected: !_isExplore,
                  selectedColor: AppColors.primary,
                  onSelected: (val) {
                    setState(() { _isExplore = false; });
                    _fetchFeed(refresh: true);
                  },
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: Text('Explorer', style: TextStyle(color: _isExplore ? Colors.black : Colors.white)),
                  selected: _isExplore,
                  selectedColor: AppColors.primary,
                  onSelected: (val) {
                    setState(() { _isExplore = true; });
                    _fetchFeed(refresh: true);
                  },
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage()));
              },
            ),
          ],
        ),
      ),
      body: _isLoading && _posts.isEmpty
          ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
          : RefreshIndicator(
              color: AppColors.primary,
              onRefresh: () => _fetchFeed(refresh: true),
              child: _posts.isEmpty
                  ? const Center(
                      child: Text(
                        'Aucune publication pour le moment.\nSuivez des Otakus ou explorez le WooVerse !',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _posts.length,
                      itemBuilder: (context, index) {
                        final item = _posts[index];
                        final user = item['user'] ?? {};
                        final pseudo = user['pseudo'] ?? 'Otaku';
                        final rank = user['rank'] ?? 'F-';
                        final content = item['content'] ?? '';
                        final likesCount = '${item['reactions_count'] ?? 0}';
                        final commentsCount = '${item['comments_count'] ?? 0}';
                        final mediaList = item['media'] as List<dynamic>? ?? [];
                        final mediaUrl = mediaList.isNotEmpty ? mediaList[0]['url'] : null;

                        return Card(
                          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          color: Colors.grey.shade900,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: AppColors.primary,
                                      child: Text(pseudo[0].toUpperCase(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(pseudo, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                                              const SizedBox(width: 6),
                                              Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                                                decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(8)),
                                                child: Text('Rang $rank', style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
                                              ),
                                            ],
                                          ),
                                          const Text('A l\'instant', style: TextStyle(color: Colors.white54, fontSize: 11)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                if (content.isNotEmpty) ...[
                                  const SizedBox(height: 10),
                                  Text(content, style: const TextStyle(color: Colors.white, fontSize: 14)),
                                ],
                                if (mediaUrl != null) ...[
                                  const SizedBox(height: 10),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      mediaUrl,
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) => const SizedBox(),
                                    ),
                                  ),
                                ],
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.local_fire_department, color: Colors.orange),
                                          onPressed: () async {
                                            await FeedService.reactToPost(item['id'], '🔥');
                                            _fetchFeed(refresh: true);
                                          },
                                        ),
                                        Text(likesCount, style: const TextStyle(color: Colors.white70)),
                                        const SizedBox(width: 16),
                                        const Icon(Icons.comment_outlined, color: Colors.white70, size: 20),
                                        const SizedBox(width: 4),
                                        Text(commentsCount, style: const TextStyle(color: Colors.white70)),
                                      ],
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.bookmark_border, color: Colors.white70),
                                      onPressed: () async {
                                        await FeedService.toggleBookmark(item['id']);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}