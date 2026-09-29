import 'package:flutter/material.dart';

class Rechercher extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback onPressed; // Remplacer onTap par onPressed

  const Rechercher({
    required this.controller,
    required this.hintText,
    required this.onPressed, // Initialisation de onPressed
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {}, // Garder un onTap vide pour gérer l'interaction avec l'input
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // Espacement intérieur
        decoration: BoxDecoration(
          color: const Color.fromARGB(117, 180, 180, 180), // Couleur gris clair pour le fond
          borderRadius: BorderRadius.circular(100.0), // Bords arrondis
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              blurRadius: 8.0,
              offset: const Offset(0, 4), // Ombre légère
            ),
          ],
        ),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black), // Icône de recherche
              onPressed: onPressed, // Utilisation de onPressed pour l'action
            ),
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText, // Texte indicatif
                  border: InputBorder.none, // Pas de bordure par défaut
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
