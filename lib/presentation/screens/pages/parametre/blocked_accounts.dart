import 'package:flutter/material.dart';
import 'package:woo/core/widgets/color.dart';

class BlockedAccountsPage extends StatefulWidget {
  const BlockedAccountsPage({super.key});
  @override
  State<BlockedAccountsPage> createState() => _BlockedAccountsPageState();
}

class _BlockedAccountsPageState extends State<BlockedAccountsPage> {
  // Sample list of blocked accounts with individual images
  List<Map<String, dynamic>> blockedAccounts = [
    {
      'name': 'pseudo1',
      'username': '@pseudo1',
      'image': AssetImage("images/n1.png")
    },
    {
      'name': 'pseudo2',
      'username': '@pseudo2',
      'image': AssetImage("images/n2.png")
    },
    {
      'name': 'pseudo3',
      'username': '@pseudo3',
      'image': AssetImage("images/n3.png")
    },
    {
      'name': 'pseudo4',
      'username': '@pseudo4',
      'image': AssetImage("images/n4.png")
    },
    {
      'name': 'pseudo5',
      'username': '@pseudo5',
      'image': AssetImage("images/n1.png")
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('Comptes bloqués'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.white,
      ),
      body: ListView.builder(
        itemCount: blockedAccounts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: blockedAccounts[index]['image'],
            ),
            title: Text(
              blockedAccounts[index]['name']!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(blockedAccounts[index]['username']!),
            trailing: OutlinedButton(
              onPressed: () {
                setState(() {
                  blockedAccounts.removeAt(index);
                });
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColors.primary),
              ),
              child: Text(
                'Débloquer',
                style: TextStyle(color: AppColors.primary),
              ),
            ),
          );
        },
      ),
    );
  }
}
