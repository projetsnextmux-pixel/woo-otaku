import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle poppinsMedium = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500, // Medium
  );

  static const TextStyle poppinsRegular = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400, // Regular
  );

  static const TextStyle poppinsSemiBold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600, // SemiBold
  );
}

class CustomTextWidget extends StatelessWidget {
  final String content; // Texte à afficher
  final Color color; // Couleur du texte
  final TextStyle? font; // Style de police

  CustomTextWidget({
    required this.content,
    this.color = Colors.white, // Couleur par défaut
    this.font, required String fontFamily, // Police par défaut peut être null
  });

  @override
  Widget build(BuildContext context) {
    List<String> words = content.split(" ");
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: words.map((word) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.5),
            child: Text(
              word,
              style: font?.copyWith(color: color) ?? // Appliquer la police personnalisée ou la valeur par défaut
                  TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
