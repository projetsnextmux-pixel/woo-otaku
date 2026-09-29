import 'package:flutter/material.dart';
import 'package:woo/core/widgets/bottom_navigation.dart';
import 'package:woo/core/widgets/hashtag_widget.dart';
import 'package:woo/presentation/screens/pages/chatTeam.dart';
import 'package:woo/presentation/screens/pages/create_news.dart';
import 'package:woo/presentation/screens/pages/news.dart';
import 'package:woo/presentation/screens/pages/notification.dart';
import 'package:woo/presentation/screens/pages/profile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 1; // par défaut onglet Messages
  final List<Widget> _pages = [
    NewsPage(),
    ChatTeamPage(),
    CreatePage(),
    NotifiPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => _pages[index]),
    );
  }

  // Exemples de titres et de comptes pour chaque ligne
  final List<Map<String, String>> _hashtagsData = [
    {'title': 'woo',        'count': 'Nombre de publications'},
    {'title': 'mot clé',    'count': 'Nombre de publications'},
    {'title': 'mot clé',    'count': 'Nombre de publications'},
    {'title': 'mot clé',    'count': 'Nombre de publications'},
    {'title': 'mot clé',    'count': 'Nombre de publications'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Icon(Icons.search, color: Colors.grey),
              const SizedBox(width: 8),
              Text('Rechercher', style: TextStyle(color: Colors.grey.shade600)),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        itemCount: _hashtagsData.length,
        itemBuilder: (context, index) {
          final data = _hashtagsData[index];
          return HashtagWidget(
            title: data['title']!,
            subtitle: data['count']!,
            // onAddTap peut être utilisé pour le "+"
            onAddTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Ajouter un nouveau hashtag pour « ${data['title']} »")),
              );
            },
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
