import 'package:flutter/material.dart';
import 'package:woo/core/widgets/chat.dart';
// Assurez-vous que ce chemin est correct

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Chat(
        name: 'Nom de l’utilisateur', // Ajoutez le nom que vous souhaitez afficher dans l'AppBar
      ),

    );
  }
}
