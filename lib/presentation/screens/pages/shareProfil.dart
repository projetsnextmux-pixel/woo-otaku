import 'package:flutter/material.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/core/widgets/font.dart';

class ShareProfil extends StatefulWidget {
  const ShareProfil({super.key});
  @override
  State<ShareProfil> createState() => _ShareProfilState();
}

class _ShareProfilState extends State<ShareProfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              backgroundColor: AppColors.white,
              centerTitle: true,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: AppColors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                "Partager le profil",
                style: AppTextStyles.poppinsRegular.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              height: 1.5,
              color: Colors.grey.shade300,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Fond de la page
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.white,
            ),
          ),

          // Contenu principal de la page
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 150),

                // Icône en haut de la page
                Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 0.0), // Espacement supérieur
                      child: Icon(
                        Icons.link,
                        color: AppColors.white,
                        size: 100,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Texte en dessous de l'icône
                Center(
                  child: SizedBox(
                    width: 300,
                    child: const Text(
                      "otakutaku.com/pseudo",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.text,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 100),

                // Bouton "Copier le lien"
                Center(
                  child: Container(
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: AppColors.primary,
                        width: 1.0,
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Copier le lien',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
