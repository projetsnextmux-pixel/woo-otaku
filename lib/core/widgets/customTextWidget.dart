import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String content;
  final String? fontFamily;
  final double? baseFontSize;
  final Color color;
  final FontWeight fontWeight;

  const CustomTextWidget({
    Key? key,
    required this.content,
    this.fontFamily,
    this.baseFontSize,
    this.color = Colors.white,
    this.fontWeight = FontWeight.w800,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // découpe la chaîne en mots (ignore espaces multiples)
    final words = content.trim().split(RegExp(r'\s+'));

    // taille responsive — tu peux surcharger via baseFontSize
    final width = MediaQuery.of(context).size.width;
    final defaultSize = (width * 0.12).clamp(36.0, 80.0);
    final fontSize = (baseFontSize ?? defaultSize);

    final style = TextStyle(
      color: color,
      fontSize: fontSize,
      height: 0.9, // espace vertical entre les lignes (ajuste si besoin)
      fontWeight: fontWeight,
      letterSpacing: 0.3,
      fontFamily: fontFamily,
      
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start, // garde l'alignement à gauche
      children: words.map((w) {
        return Text(w, style: style);
      }).toList(),
    );
  }
}
// 