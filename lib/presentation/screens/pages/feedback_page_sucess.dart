import 'package:flutter/material.dart';
import 'package:woo/core/widgets/color.dart';

class FeedbackPageSucess extends StatefulWidget {
  const FeedbackPageSucess({super.key});
  @override
  State<FeedbackPageSucess> createState() => _FeedbackPageSucessState();
}

class _FeedbackPageSucessState extends State<FeedbackPageSucess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image de fond
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
                const SizedBox(height: 250),
                // Image en haut de la page
                Center(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0), // Espacement supérieur
                      child: Image.asset(
                        'images/ss.png', // Chemin de l'image
                        height: 150, // Hauteur de l'image
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                Center(
                  child: SizedBox(
                    width: 300, // Définir la largeur souhaitée
                    child: Text(
                      "Message envoyé",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                      textAlign: TextAlign
                          .center, // Centrer le texte à l'intérieur du conteneur
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                Center(
                  child: SizedBox(
                    width: 300, // Définir la largeur souhaitée
                    child: Text(
                      "Nous te remercions pour ton idée",
                      style: TextStyle(
                        fontSize: 17,
                        color: AppColors.black,
                      ),
                      textAlign: TextAlign
                          .center, // Centrer le texte à l'intérieur du conteneur
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
