import 'package:flutter/material.dart';
// import 'package:otaku/core/widgets/button.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/core/widgets/font.dart';
import 'package:woo/presentation/screens/pages/slashscreens/404.dart';

class ComptePage extends StatefulWidget {
  const ComptePage({super.key});
  @override
  State<ComptePage> createState() => _ComptePageState();
}

class _ComptePageState extends State<ComptePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Compte",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey.shade500,
            height: 1.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Titre principal avec redirection
            GestureDetector(
              onTap: () {
                // Redirection vers la page de changement de mot de passe
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Break()));
              },
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Changer mon mot de passe",
                  style: AppTextStyles.poppinsSemiBold.copyWith(
                    color: AppColors.text,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5), // Espacement entre les éléments

            // Mes centres d'intérêts avec redirection
            GestureDetector(
              onTap: () {
                // Redirection vers la page des centres d'intérêts
                Navigator.pushNamed(context, '/interests');
              },
              child: Container(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Mes centres d'intérêts",
                  style: AppTextStyles.poppinsSemiBold.copyWith(
                    color: AppColors.text,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Supprimer le compte avec redirection
            GestureDetector(
              onTap: () {
                // Redirection vers la page de suppression de compte
                Navigator.pushNamed(context, '/delete-account');
              },
              child: Container(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Supprimer le compte",
                  style: AppTextStyles.poppinsSemiBold.copyWith(
                    color: Colors.red,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
