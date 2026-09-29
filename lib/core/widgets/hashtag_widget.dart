import 'package:flutter/material.dart';
import 'package:woo/core/widgets/color.dart'; // Assurez-vous que ce chemin est correct

// Assumons que AppColors est défini comme ceci pour cet exemple


class HashtagWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onAddTap;

  const HashtagWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    this.onAddTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Exemple d’images à afficher ; adapte-les à ton modèle de données
    final images = [
      'images/5bd5fc17416c01761655b8e5335c6f03.jpg',
      'images/logo.png',
      'images/animes.jpeg',
      'images/5bd5fc17416c01761655b8e5335c6f03.jpg', // Répété pour avoir 4 images comme sur l'image
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Barre « # titre »
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                // Cercle avec le dièse (#)
                Container(
                  width: 30, // Taille du cercle
                  height: 30, // Taille du cercle
                  decoration: BoxDecoration(
                    color: AppColors.primary, // Couleur de fond du cercle
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      '#',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18, // Taille de la police du dièse
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12), // Espacement entre le cercle et le texte
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Alignement à gauche du texte
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(color: Colors.grey, fontSize: 13), // Taille de police légèrement plus petite
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Liste d’images + bouton +
          SizedBox(
            height: 90,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: images.length + 1, // +1 pour le bouton Ajouter
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, i) {
                if (i == images.length) {
                  // Bouton « + »
                  return GestureDetector(
                    onTap: onAddTap,
                    child: Container(
                      width: 80,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary, width: 2), // Bordure plus épaisse
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: AppColors.primary,
                          size: 32,
                        ),
                      ),
                    ),
                  );
                }
                // Vignette image
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    images[i],
                    width: 80,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8), // Espace après les images si un Divider suit
          const Divider(height: 1), // Ajout d'un Divider pour séparer les HashtagWidget
        ],
      ),
    );
  }
}