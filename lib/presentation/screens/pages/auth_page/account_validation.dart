import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:woo/core/widgets/button.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/core/widgets/formfield.dart';
import 'package:woo/presentation/screens/pages/interest_selection.dart';



class AccountValidation extends StatefulWidget {
  @override
  _AccountValidationState createState() => _AccountValidationState();
}

class _AccountValidationState extends State<AccountValidation> {


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
          Container(color: Colors.black.withValues(alpha: 0.6)),
          // Contenu principal de la page
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 40.0, left: 10.0, right: 10.0),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 40),
                Center(
     
                  child: Container(
                    width: 300, // Définir la largeur souhaitée
                    child: Text(
                      "Q1 : Quelles sont les deux premières lettres de tes trois mangas favoris ?",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign
                          .center, // Centrer le texte à l'intérieur du conteneur
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Espace uniforme entre les champs
                  children: [
                    Expanded(
                      child: FormFieldWidget(
                        // prefixIconWidget: Icon(Icons.text_fields, color: Colors.white),
                        onTap: () {
                          // Action pour le premier champ
                        },
                      ),
                    ),
                    const SizedBox(width: 10), // Espacement entre les champs
                    Expanded(
                      child: FormFieldWidget(
                        // prefixIconWidget: Icon(Icons.text_fields, color: Colors.white),
                        onTap: () {
                          // Action pour le deuxième champ
                        },
                      ),
                    ),
                    const SizedBox(width: 10), // Espacement entre les champs
                    Expanded(
                      child: FormFieldWidget(
                        // prefixIconWidget: Icon(Icons.text_fields, color: Colors.white),
                        onTap: () {
                          // Action pour le troisième champ
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                Center(
                  child: Container(
                    child: Text(
                      "Q2 : Quelles sont tes trois personnages favoris ?",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign
                          .center, // Centrer le texte à l'intérieur du conteneur
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Espace uniforme entre les champs
                  children: [
                    Expanded(
                      child: FormFieldWidget(
                        // prefixIconWidget: Icon(Icons.text_fields, color: Colors.white),
                        onTap: () {
                          // Action pour le premier champ
                        },
                      ),
                    ),
                    const SizedBox(width: 10), // Espacement entre les champs
                    Expanded(
                      child: FormFieldWidget(
                        // prefixIconWidget: Icon(Icons.text_fields, color: Colors.white),
                        onTap: () {
                          // Action pour le deuxième champ
                        },
                      ),
                    ),
                    const SizedBox(width: 10), // Espacement entre les champs
                    Expanded(
                      child: FormFieldWidget(
                        // prefixIconWidget: Icon(Icons.text_fields, color: Colors.white),
                        onTap: () {
                          // Action pour le troisième champ
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),
                Center(
                  child: Container(
                    width: 300, // Définir la largeur souhaitée
                    child: Text(
                      "Q2 : Quelles est ton premier mangas ?",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign
                          .center, // Centrer le texte à l'intérieur du conteneur
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Pseudonyme Field avec FormFieldWidget
                FormFieldWidget(
                  onTap: () {
                    // Action sur le tap si nécessaire
                  },
                ),

                const SizedBox(height: 90),

                Center(
                  child: Button(
                    name: 'Suivant',
                    buttonColor: AppColors.primary,
                    buttonTextColor: colorScheme.surface,
                    borderbuttonColor: AppColors.white,
                    buttonFonSize: 15.0,
                    buttonWidth: double
                        .infinity, // Largeur définie comme dans l'exemple précédent
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InterestSelectionPage(),
                        ),
                      );
                    },
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
