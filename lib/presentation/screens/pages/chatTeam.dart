import 'package:flutter/material.dart';
import 'package:woo/core/widgets/bottom_navigation.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/presentation/screens/pages/chat.dart'; // Assurez-vous que ce chemin est correct
import 'package:woo/presentation/screens/pages/create_news.dart';
import 'package:woo/presentation/screens/pages/news.dart';
import 'package:woo/presentation/screens/pages/notification.dart';
import 'package:woo/presentation/screens/pages/profile.dart';
import 'package:woo/presentation/screens/pages/teamCreat.dart'; //

class ChatTeamPage extends StatefulWidget {
  @override
  _ChatTeamPageState createState() => _ChatTeamPageState();
}

class _ChatTeamPageState extends State<ChatTeamPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    // For bottom navigation
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
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(context, MaterialPageRoute(builder: (_) => _pages[index]));
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: brightness == Brightness.dark ? Colors.black : Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(
              color:
                  brightness == Brightness.dark
                      ? Colors.grey.shade700
                      : Colors.grey.shade300,
            ),
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(Icons.search, color: colorScheme.secondary),
              SizedBox(width: 8),
              Text(
                'Rechercher',
                style: TextStyle(color: colorScheme.secondary, fontSize: 16),
              ),
            ],
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.add_circle, color: AppColors.primary, size: 28),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onSelected: (value) {
              if (value == 'new_chat') {
                // Action pour nouvelle conversation
                print("Nouvelle conversation sélectionnée");
              } else if (value == 'new_group') {
                // Action pour nouveau groupe
                print("Nouveau groupe sélectionné");
              }
            },
            itemBuilder:
                (BuildContext context) => [
                  PopupMenuItem<String>(
                    value: 'new_chat',
                    child: Row(
                      children: [
                        // Icon(Icons.message, color: AppColors.primary),
                        const SizedBox(width: 12),
                        const Text('Nouvelle conversation'),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'new_group',
                    child: Row(
                      children: [
                        // Icon(Icons.group_add, color: AppColors.primary),
                        const SizedBox(width: 12),
                        const Text('Nouveau groupe'),
                      ],
                    ),
                  ),
                ],
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Column(
            children: [
              Divider(color: Colors.grey.shade400, height: 1, thickness: 1),
              TabBar(
                controller: _tabController,
                labelColor: AppColors.primary,
                unselectedLabelColor: Color.fromRGBO(60, 78, 243, 0.644),
                indicatorColor: AppColors.primary,
                indicatorWeight: 2,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [Tab(text: 'Messages'), Tab(text: 'Groupes')],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _ConversationsList(
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => MessagePage()),
                ),
          ),
          _ConversationsList(
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => TeamCreatePage()),
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

class _ConversationsList extends StatelessWidget {
  final VoidCallback onTap;
  const _ConversationsList({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final items = List.generate(
      4,
      (i) => {
        'avatar': 'images/n1.png',
        'name': 'Pseudo',
        'subtitle': 'Dernier message',
        'time': '${i + 2}',
      },
    );

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(item['avatar']!),
            radius: 20,
          ),
          title: Text(
            item['name']!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          subtitle: Text(item['subtitle']!),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Temps',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
              const SizedBox(height: 4),
              Container(
                width: 34,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  item['time']!,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
          onTap: onTap,
        );
      },
    );
  }
}
