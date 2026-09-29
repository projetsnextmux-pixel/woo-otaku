import 'package:flutter/material.dart';
import 'package:woo/core/widgets/font.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/core/widgets/button.dart';
import 'package:woo/presentation/screens/pages/feedback_page_sucess.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  String selectedOption = "Public"; // Option sélectionnée par défaut
  final List<String> options = ["Public", "Abonnés"]; // Liste des options

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
                'Aide-nous à améliorer Woo',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Champ "Ajouter une description"
            Center(
              child: Container(
                child: Text(
                  "Dis-nous comment nous pouvons amélorer Woo",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                  textAlign: TextAlign
                      .center, // Centrer le texte à l'intérieur du conteneur
                ),
              ),
            ),

            const SizedBox(height: 10),
            TextFormField(
              maxLines: 5, // Nombre de lignes visibles
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15), // Bordures arrondies
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Colors
                        .blue, // Couleur de bordure quand le champ est actif
                    width: 0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Colors
                        .transparent, // Couleur de bordure quand le champ est inactif
                    width: 0,
                  ),
                ),
                fillColor: Colors.grey[200], // Couleur de fond
                filled: true, // Activer la couleur de fond
                labelText: "Saisis ton message", // Label multiligne
                alignLabelWithHint:
                    true, // Aligne le label avec la hauteur du champ
                labelStyle: const TextStyle(
                  color: Colors.grey, // Couleur du label
                  fontSize: 14, // Taille du texte du label
                ),
              ),
              style: const TextStyle(
                color: Colors.black, // Couleur du texte
                fontSize: 16, // Taille du texte saisi
              ),
            ),
            const SizedBox(height: 150),

            // Bouton "Publier"
            GestureDetector(
              child: Button(
                name: 'Envoyer',
                buttonColor: AppColors.primary,
                buttonTextColor: AppColors.white,
                buttonFonSize: 15,
                onTap: () {
                  // Action lorsque le bouton "Publier" est appelé
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeedbackPageSucess()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
