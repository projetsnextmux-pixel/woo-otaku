import 'package:flutter/material.dart';
import 'package:woo/core/widgets/font.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/core/widgets/button.dart';

class CreatePage3 extends StatefulWidget {
  const CreatePage3({super.key});

  @override
  State<CreatePage3> createState() => _CreatePage3State();
}

class _CreatePage3State extends State<CreatePage3> {
  String selectedOption = "Public"; // Option sélectionnée par défaut
  final List<String> options = ["Public", "Abonnés"]; // Liste des options

  @override
  Widget build(BuildContext context) {
        final colorScheme = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              centerTitle: true,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: colorScheme.onSurface),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                'Publier',
                style: AppTextStyles.poppinsRegular.copyWith(
                  color: colorScheme.onSurface,
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
            Text(
              "Ajouter une description",
              style: TextStyle(
                color: colorScheme.onSurface,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1.5,
                  ),
                ),
                fillColor:  brightness == Brightness.dark ? Colors.grey.shade900 : Colors.grey.shade200,
                filled: true,
              ),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
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
                    color: colorScheme.onSurface,
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
                                color: colorScheme.onSurface,
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
                  child: Row(
                    children: [
                      Text(
                        selectedOption,
                        style: TextStyle(
                          color: colorScheme.onSurface,
                          fontSize: 15,
                        ),
                      ),
                       Icon(Icons.arrow_drop_down, color: colorScheme.onSurface),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        0), // Supprimer les coins arrondis
                  ),
                  constraints: const BoxConstraints(
                    minWidth: double.infinity, // Largeur 100% de l'écran
                    maxWidth: double.infinity,
                  ),
                  color: AppColors.white, // Couleur de fond
                  elevation: 0, // Supprimer l'ombre (box shadow)
                ),
              ],
            ),
            const SizedBox(height: 150),

            // Bouton "Publier"
            GestureDetector(
              child: Button(
                name: 'Publier',
                buttonColor: AppColors.primary,
              buttonTextColor: colorScheme.surface,
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
