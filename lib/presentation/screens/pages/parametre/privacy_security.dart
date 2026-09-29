import 'package:flutter/material.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/presentation/screens/pages/parametre/blocked_accounts.dart';
import 'package:woo/presentation/screens/pages/parametre/who_comment.dart';
import 'package:woo/presentation/screens/pages/parametre/who_reacte.dart';
import 'package:woo/presentation/screens/pages/parametre/who_send_me.dart';

class ConfidentialitePage extends StatefulWidget {
  const ConfidentialitePage({super.key});
  @override
  State<ConfidentialitePage> createState() => _ConfidentialitePageState();
}

class _ConfidentialitePageState extends State<ConfidentialitePage> {
  // Toggle states for switches
  bool isPrivateAccount = false;
  bool isSuggestAccount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('Confidentialité et sécurité'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.white,
      ),
      body: ListView(
        children: [
          // Private Account Toggle
          ListTile(
            title: Text('Compte privé'),
            subtitle: Text(
              "Grâce au compte privé, seuls les utilisateurs que tu approuves peuvent s'abonner à toi et voir tes publications.\nTes abonnés existants ne seront pas affectés.",
            ),
            trailing: Switch(
              value: isPrivateAccount,
              onChanged: (value) {
                setState(() {
                  isPrivateAccount = value;
                });
              },
              activeTrackColor: AppColors.primary,
              inactiveTrackColor: Colors.white,
            ),
          ),

          Divider(),

          // Suggest Account Toggle
          ListTile(
            title: Text('Suggérer ton compte à d’autres'),
            subtitle: Text(
              "Choisir si ton profil peut être suggéré aux utilisateurs intéressés aux comptes comme le tien.",
            ),
            trailing: Switch(
              value: isSuggestAccount,
              onChanged: (value) {
                setState(() {
                  isSuggestAccount = value;
                });
              },
              activeTrackColor: AppColors.primary,
              inactiveTrackColor: Colors.white,
            ),
          ),

          Divider(),

          // Other Options
          ListTile(
            title: Text("Qui peut t'envoyer des messages directs"),
            onTap: () {
              // Navigate to relevant page or functionality
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WhoSendMe()),
              );
            },
          ),
          ListTile(
            title: Text("Qui peut réagir à tes publications"),
            onTap: () {
              // Navigate to relevant page or functionality
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WhoReacte()),
              );
            },
          ),
          ListTile(
            title: Text("Qui peut commenter tes publications"),
            onTap: () {
              // Navigate to relevant page or functionality
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WhoCommente()),
              );
            },
          ),
          ListTile(
            title: Text("Comptes bloqués"),
            onTap: () {
              // Navigate to relevant page or functionality
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BlockedAccountsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
