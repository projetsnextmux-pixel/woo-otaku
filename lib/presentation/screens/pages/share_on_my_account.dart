import 'package:flutter/material.dart';
import 'package:woo/core/widgets/font.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/core/widgets/button.dart';

class Patagersurmoncompt extends StatefulWidget {
  const Patagersurmoncompt({super.key});

  @override
  State<Patagersurmoncompt> createState() => _PatagersurmoncomptState();
}

class _PatagersurmoncomptState extends State<Patagersurmoncompt> {
  String selectedOption = "Public"; // Option sélectionnée par défaut
  final List<String> options = ["Public", "Abonnés"]; // Liste des options
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white, // Couleur de fond pour le body
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), // Hauteur personnalisée de l'AppBar
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              backgroundColor: AppColors.white,
              centerTitle: true, // Centrer le titre dans l'AppBar
              elevation: 0, // Supprime l'ombre par défaut
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back, // Icône de flèche retour
                  color: AppColors.black, // Couleur de l'icône
                ),
                onPressed: () {
                  Navigator.pop(context); // Action pour revenir à la page précédente
                },
              ),
              title: Text(
                'Partager sur mon compte',
                style: AppTextStyles.poppinsRegular.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              height: 2, // Hauteur de la bordure
              color: Colors.grey.shade300, // Couleur de la bordure
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Label et champ de texte
            Text(
              "Description",
              style: TextStyle(color: AppColors.black, fontSize: 15),
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
                    color: Colors.blue, // Couleur de bordure quand le champ est actif
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Colors.grey, // Couleur de bordure quand le champ est inactif
                    width: 1.5,
                  ),
                ),
                fillColor: Colors.white, // Couleur de fond
                filled: true, // Activer la couleur de fond
                labelText: "Post description\n#cosplay #otaku #hashtag", // Label multiligne
                alignLabelWithHint: true, // Aligne le label avec la hauteur du champ
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
            const SizedBox(height: 20),

            // Menu déroulant "Qui peut voir la publication"
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Qui peut voir la publication",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    setState(() {
                      selectedOption =
                          value; // Mettre à jour l'option sélectionnée
                    });
                  },
                  offset: const Offset(
                      0, 30), // Décalage horizontal (x: 0) et vertical (y: 10)
                  itemBuilder: (BuildContext context) {
                    return options.map((String option) {
                      return PopupMenuItem<String>(
                        value: option,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              option,
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 15,
                              ),
                            ),
                            if (option == selectedOption)
                              const Icon(Icons.check, color: Colors.blue),
                          ],
                        ),
                      );
                    }).toList();
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: double.infinity,
                    maxWidth: double.infinity,
                  ),
                  color: AppColors.white,
                  elevation: 0,
                  child: Row(
                    children: [
                      Text(
                        selectedOption,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 15,
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down, color: Colors.black),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 150),

            // Bouton "Terminer"
            GestureDetector(
              child: Button(
                name: 'Partager',
                buttonColor: AppColors.primary,
                buttonTextColor: AppColors.white,
                buttonFonSize: 15,
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
