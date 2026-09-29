import 'package:flutter/material.dart';
import 'package:woo/core/widgets/bottom_navigation.dart';

import 'package:woo/presentation/screens/pages/chatTeam.dart';
import 'package:woo/presentation/screens/pages/create_news.dart';
import 'package:woo/presentation/screens/pages/news.dart';
import 'package:woo/presentation/screens/pages/profile.dart'; // Assurez-vous que ce chemin est correct

class NotifiPage extends StatefulWidget {
  const NotifiPage({super.key});
  @override
  State<NotifiPage> createState() => _NotifiPageState();
}

class _NotifiPageState extends State<NotifiPage> {
  int _selectedIndex = 3; // L'index initial est 1 pour afficher NotifiPage

  final List<Map<String, String>> notifications = [
    {"message": "@pseudo a réagi à ta publication", "time": "Il y a 2h"},
    {"message": "@pseudo a commenté ta publication", "time": "Il y a 2h"},
    {"message": "@pseudo a aimé ton commentaire", "time": "Il y a 2h"},
    {"message": "@pseudo a répondu à ton commentaire", "time": "Il y a 2h"},
    {"message": "@pseudo s'est abonné à toi", "time": "Il y a 2h"},
    {
      "message":
          "@pseudo t'invite à rejoindre le groupe de discussion @nomdugroupe",
      "time": "Il y a 2h"
    },
  ];

  // Fonction de callback qui change l'index sélectionné
  final List<Widget> _pages = [
    NewsPage(), // Remplacez par la page d'accueil
    ChatTeamPage(), // Remplacez par la page de messages
    CreatePage(), // Remplacez par la page de messages
    NotifiPage(), // Remplacez par la page de messages
    ProfilePage(), // Remplacez par la page de profil
  ];

  // Fonction de callback qui change l'index sélectionné
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
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(color: Colors.grey.shade500, height: 1),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(
                  "images/animes.jpeg"), // Remplacez par l'image appropriée
            ),
            title: Text(
              notification['message']!,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              notification['time']!,
              style: TextStyle(color: Colors.grey),
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex, // Passez l'index sélectionné
        onItemTapped: _onItemTapped, // Passez la fonction callback
      ),
    );
  }
}
