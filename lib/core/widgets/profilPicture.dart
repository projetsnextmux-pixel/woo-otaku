import 'package:flutter/material.dart';

class ProfilPicture extends StatelessWidget {
  final String imageUrl; // URL de l'image de profil
  final double size; // Taille du cercle de l'image de profil
  final VoidCallback onCameraTap; // Callback pour l'action caméra

  const ProfilPicture({
    super.key,
    required this.imageUrl,
    this.size = 100.0, // Taille par défaut de l'image de profil
    required this.onCameraTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          // Cercle contenant l'image de profil
          CircleAvatar(
            radius: size / 2,
            backgroundImage: NetworkImage(imageUrl), // Charger l'image via une URL
            backgroundColor: Colors.grey.shade300, // Couleur de fond si l'image échoue
          ),
          // Bouton flottant pour prendre une photo
          FloatingActionButton(
            mini: true, // Taille réduite pour le bouton
            onPressed: onCameraTap, // Action lors de l'appui
            child: const Icon(Icons.camera_alt, size: 20),
          ),
        ],
      ),
    );
  }
}
