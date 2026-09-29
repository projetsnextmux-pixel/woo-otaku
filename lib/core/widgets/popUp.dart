import 'package:flutter/material.dart';

import 'package:woo/core/widgets/color.dart';
import 'package:woo/presentation/screens/pages/news.dart';
import 'package:woo/presentation/screens/pages/publication_change.dart'; // Importer le nouveau widget

class PopUpContent extends StatelessWidget {
  final String title;
  final String content;
  final List<Map<String, dynamic>> buttons; // Boutons dynamiques

  const PopUpContent({
    Key? key,
    required this.title,
    required this.content,
    required this.buttons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: buttons.map((button) {
        return TextButton(
          onPressed: () {
            if (button['onPressed'] != null) {
              button['onPressed'](); // Exécute l'action personnalisée
            }
            if (button['closePopup'] == true) {
              Navigator.of(context).pop(); // Ferme le popup si spécifié
            }
          },
          child: Text(button['label']),
        );
      }).toList(),
    );
  }
}

void showDeleteDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor:Colors.white,
      insetPadding:
          EdgeInsets.zero, // Supprime la marge autour de l'AlertDialog
      contentPadding: EdgeInsets.zero, // Supprime la marge autour du contenu
      actionsPadding: EdgeInsets.zero, // Supprime la marge autour des actions
      titlePadding: EdgeInsets.zero, // Supprime le padding autour du titre
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const SizedBox(
                  width: 200,
                  child: Text(
                    "Veux-tu supprimer ?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.text,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "NON",
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NewsPage()));
                  },
                  child: const Text(
                    "OUI",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}



void showAnnulerDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor:Colors.white,
      insetPadding:
          EdgeInsets.zero, // Supprime la marge autour de l'AlertDialog
      contentPadding: EdgeInsets.zero, // Supprime la marge autour du contenu
      actionsPadding: EdgeInsets.zero, // Supprime la marge autour des actions
      titlePadding: EdgeInsets.zero, // Supprime le padding autour du titre
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const SizedBox(
                  width: 200,
                  child: Text(
                    "Veux-tu annuler ?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.text,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "NON",
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NewsPage()));
                  },
                  child: const Text(
                    "OUI",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}






void showBlocked(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Center( // Centre l'ensemble du dialogue
        child: Container(
          // margin: const EdgeInsets.symmetric(horizontal: 25),
          child: AlertDialog(
            content: Column( // Utilisation de Column pour empiler les Text
              mainAxisSize: MainAxisSize.min, // Empêche la colonne de prendre trop de place
              crossAxisAlignment: CrossAxisAlignment.center, // Aligner les Text à gauche
              children: [
                Text(
                  "Vraiment? Cet utilisateur ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.text, 
                    fontSize: 15,
                    ),
                ),
                Text(
                  "ne pourra plus consulter ton ", // Texte en gras
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "profil ou tes contenus",
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            actions: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Ferme la boîte de dialogue
                        },
                        child: const Text(
                          "Annuler",
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Ferme la boîte de dialogue
                        },
                        child: const Text(
                          "Confirmer",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showTeamInfo(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      insetPadding:
          EdgeInsets.zero, // Supprime la marge autour de l'AlertDialog
      contentPadding: EdgeInsets.zero, // Supprime la marge autour du contenu
      actionsPadding: EdgeInsets.zero, // Supprime la marge autour des actions
      titlePadding: EdgeInsets.zero, // Supprime le padding autour du titre

      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(
                20.0), // Ajoute une marge interne de 16 pixels tout autour
            child: Column(
              children: [
                const SizedBox(height: 20),
                const SizedBox(
                  width: 200, // Largeur définie pour le texte
                  child: Text(
                    "Veux-tu rejoindre le groupe ?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.text,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "NON",
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "OUI",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

void showPopupAvis(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      insetPadding:
          EdgeInsets.zero, // Supprime la marge autour de l'AlertDialog
      contentPadding: EdgeInsets.zero, // Supprime la marge autour du contenu
      actionsPadding: EdgeInsets.zero, // Supprime la marge autour des actions
      titlePadding: EdgeInsets.zero, // Supprime le padding autour du titre

      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(
                20.0), // Ajoute une marge interne de 16 pixels tout autour
            child: Column(
              children: [
                Image.asset(
                  "images/5bd5fc17416c01761655b8e5335c6f03.jpg", // Remplacez par le chemin correct de l'image
                  height: 100,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  width: 200, // Largeur définie pour le texte
                  child: Text(
                    "Donne-nous 5 étoiles si tu aimes WOO",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: AppColors.text, width: 1.0),
                    right: BorderSide(color: AppColors.text, width: 1.0),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    print("Annulé !");
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Annuler",
                    style: TextStyle(color: AppColors.text),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: AppColors.text, width: 1.0),
                    left: BorderSide(color: AppColors.text, width: 1.0),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    print("Confirmé !");
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "5 étoiles",
                    style: TextStyle(color: AppColors.primary),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

void showPopupAvecBoutonExterieur(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Center(
        // Centre l'ensemble du dialogue
        child: Container(
          margin: const EdgeInsets.symmetric(
              horizontal:
                  25), // Ajoute des marges pour une meilleure adaptation
          child: Column(
            mainAxisSize: MainAxisSize.min, // Réduit l'espace occupé
            children: [
              AlertDialog(
                content: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10.0), // Ajoute une marge en bas
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Ce bouton te permet de basculer en ",
                      style: const TextStyle(
                        color: AppColors.text, // Couleur du texte principal
                        fontSize: 14,
                      ),
                      children: [
                        const TextSpan(
                          text: "Abonnement", // Texte en gras
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(
                          text:
                              " pour voir les publications des comptes auxquels tu es abonné, ou en ",
                        ),
                        const TextSpan(
                          text: "Public", // Texte en gras
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(
                          text:
                              " pour voir les publications de toute la communauté.",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                  height:
                      20), // Ajoute un espacement entre le texte et le bouton
              Container(
                width: 250,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: AppColors.white,
                    width: 1.0,
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Ferme le popup
                  },
                  child: const Text(
                    'Compris',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showPopupListeOptions(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      contentPadding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 5), // Réduction de la marge
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: ListTile(
              title: const Text(
                "Modifier",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.text,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                print("Modifier ");
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Changepublication()));
              },
            ),
          ),
          Center(
            child: ListTile(
              title: const Text(
                "Épingler sur mon profil",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.text,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                print("Épingler sur mon profil");
                Navigator.pop(context);
              },
            ),
          ),
          Center(
            child: ListTile(
              title: const Text(
                "Désactiver les commentaires",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.text,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                print("Désactiver les commentaires");
                Navigator.pop(context);
              },
            ),
          ),
          Center(
            child: ListTile(
              title: const Text(
                "Supprimer",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                print("Supprimer");
                showDeleteDialog(context);
              },
            ),
          ),
        ],
      ),
    ),
  );
}

void showMasquer(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      insetPadding:
          EdgeInsets.zero, // Supprime la marge autour de l'AlertDialog
      contentPadding: EdgeInsets.zero, // Supprime la marge autour du contenu
      actionsPadding: EdgeInsets.zero, // Supprime la marge autour des actions
      titlePadding: EdgeInsets.zero, // Supprime le padding autour du titre

      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(
                20.0), // Ajoute une marge interne de 16 pixels tout autour
            child: Column(
              children: [
                const SizedBox(height: 5),
                IconButton(
                  icon: const Icon(Icons.visibility_off_outlined,
                      color: AppColors.primary),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 5),
                const SizedBox(
                  width: 200, // Largeur définie pour le texte
                  child: Text(
                    "Souhaites-tu ne plus voir ce genre de publication ?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.text,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: AppColors.text, width: 1.0),
                    right: BorderSide(color: AppColors.text, width: 1.0),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    print("Annulé !");
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "NON",
                    style: TextStyle(
                      color: AppColors.text,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: AppColors.text, width: 1.0),
                    left: BorderSide(color: AppColors.text, width: 1.0),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    print("Confirmé !");
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "OUI",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
