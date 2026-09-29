import 'package:flutter/material.dart';
import 'package:woo/core/widgets/button.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/presentation/screens/pages/create_news3.dart';

class CreatePage2 extends StatefulWidget {
  @override
  _CreatePage2State createState() => _CreatePage2State();
}

class _CreatePage2State extends State<CreatePage2> {
  @override
  Widget build(BuildContext context) {
        final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
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
          "Ajouter une nouvelle publication",
          style: TextStyle(
            color: colorScheme.onSurface,
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
      body: Column(
        children: [
          SizedBox(height: 10),
          // Image
          Padding(
            padding: const EdgeInsets.all(20.0), // Espacement supérieur
            child: Image.asset(
              "images/5bd5fc17416c01761655b8e5335c6f03.jpg", // Chemin de l'image
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Spacer(), // Prend l'espace restant

          // Bouton Suivant
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Button(
                    name: 'Suivant',
                    buttonColor: AppColors.primary, // Couleur de fond du bouton
                    buttonTextColor: colorScheme.surface, // Couleur du texte
                    buttonWidth: double.infinity,
                    buttonFonSize: 15, // Largeur du bouton (optionnel)
                    borderbuttonColor: AppColors.white, // Couleur de la bordure
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreatePage3()),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
