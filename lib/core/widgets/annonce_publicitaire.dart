import 'package:flutter/material.dart';

class AdCard extends StatelessWidget {
  final AssetImage imageUrl; // Utilisation d'AssetImage
  final String adText;
  final VoidCallback? onTap;

  const AdCard({
    required this.imageUrl,
    required this.adText,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width, // Largeur complète
        margin: const EdgeInsets.symmetric(vertical: 16.0), // Suppression des marges horizontales
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              blurRadius: 8.0,
              offset: const Offset(0, 4), // Ombre vers le bas
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image de l'annonce
            Image(
              image: imageUrl, // Utilisation d'AssetImage ici
              height: 80,
              fit: BoxFit.cover, // Ajustement de l'image
            ),
            // Texte de l'annonce
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                adText,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
