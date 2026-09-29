import 'package:flutter/material.dart';
import 'package:woo/core/services/chat_service.dart';
import 'package:woo/core/widgets/bottom_navigation.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/presentation/screens/pages/chat.dart';
import 'package:woo/presentation/screens/pages/create_news.dart';
import 'package:woo/presentation/screens/pages/news.dart';
import 'package:woo/presentation/screens/pages/notification.dart';
import 'package:woo/presentation/screens/pages/profile.dart';

class ChatTeamPage extends StatefulWidget {
  const ChatTeamPage({super.key});
  @override
  State<ChatTeamPage> createState() => _ChatTeamPageState();
}

class _ChatTeamPageState extends State<ChatTeamPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final int _selectedIndex = 1;

  List<dynamic> _conversations = [];
  bool _isLoading = true;

  List<Widget> get _pages => [
    NewsPage(),
    ChatTeamPage(),
    CreatePage(),
    NotifiPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadConversations();
  }

  Future<void> _loadConversations() async {
    setState(() { _isLoading = true; });
    try {
      final res = await ChatService.getConversations();
      final list = res['data']['data'] as List<dynamic>? ?? [];
      if (mounted) {
        setState(() {
          _conversations = list;
          _isLoading = false;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() { _isLoading = false; });
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (index != 1) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => _pages[index]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: const Text('Conversations WooVerse', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.primary,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white54,
          tabs: const [
            Tab(text: 'Messages Directs'),
            Tab(text: 'Groupes / Clans'),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
          : TabBarView(
              controller: _tabController,
              children: [
                _buildConversationsList(isGroup: false),
                _buildConversationsList(isGroup: true),
              ],
            ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildConversationsList({required bool isGroup}) {
    final filtered = _conversations.where((c) {
      final type = c['type'] ?? 'direct';
      return isGroup ? type == 'group' : type == 'direct';
    }).toList();

    if (filtered.isEmpty) {
      return RefreshIndicator(
        onRefresh: _loadConversations,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            height: 400,
            alignment: Alignment.center,
            child: Text(
              isGroup ? 'Aucun groupe pour le moment.' : 'Aucune conversation directe.\nDémarrez un chat avec un Otaku !',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadConversations,
      child: ListView.builder(
        itemCount: filtered.length,
        itemBuilder: (context, index) {
          final item = filtered[index];
          final title = item['title'] ?? item['users']?[0]?['pseudo'] ?? 'Otaku';
          final lastMsg = item['last_message']?['content'] ?? 'Nouvelle conversation';

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.primary,
              child: Text(title[0].toUpperCase(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            subtitle: Text(lastMsg, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.white70)),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => MessagePage()));
            },
          );
        },
      ),
    );
  }
}