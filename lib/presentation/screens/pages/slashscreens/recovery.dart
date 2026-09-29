import 'package:flutter/material.dart';
import 'package:woo/core/widgets/button.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/presentation/screens/pages/auth_page/account_recovery.dart';

class RecoveryPage extends StatefulWidget {
  const RecoveryPage({super.key});
  @override
  State<RecoveryPage> createState() => _RecoveryPageState();
}

class _RecoveryPageState extends State<RecoveryPage> {
  @override
  Widget build(BuildContext context) {
        final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Stack(
        children: [
          // Image de fond
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage("images/lesmangas.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Appliquer un flou noir sur l'image de fond
          Container(
              color: Colors.black
                  .withValues(alpha: 0.6), // Opacité pour créer l'effet sombre
            ),
         
          // Contenu principal de la page
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 40.0, left: 10.0, right: 10.0),
            child: Column(
              children: [
                // Bouton retour en haut à gauche
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                // Espace flexible pour centrer le contenu principal
                const SizedBox(height: 150),
                // Texte "Récupération"
                Center(
                  child: Text(
                    "Récupération",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 80),
                // Message descriptif
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Pour récupérer ton compte, il te suffit d'inscrire les réponses que tu avais données aux questions secrètes qui t'ont été posées.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 80),
                // Bouton Suivant
                Center(
                  child: Button(
                    name: 'Suivant',
                    buttonColor: AppColors.primary, // Couleur de fond du bouton
                    buttonTextColor: colorScheme.surface, // Couleur du texte
                    buttonWidth: double.infinity,
                    buttonFonSize: 15, // Taille du texte du bouton
                    borderbuttonColor: Colors.white, // Couleur de la bordure
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountRecovery()),
                      );
                    },
                  ),
                ),
                const SizedBox(
                    height:
                        20), // Espace pour éviter que le bouton touche le bas
              ],
            ),
          ),
        ],
      ),
    );
  }
}
