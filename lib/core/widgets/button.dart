import 'package:flutter/material.dart';
import 'package:woo/core/widgets/font.dart';

class Button extends StatefulWidget {
  final String name;
  final Color buttonColor;
  final Color buttonTextColor;
  final Color? borderbuttonColor;
  final double buttonFonSize;
  final double? buttonWidth; // Variable pour la largeur du bouton
  final bool isTransparent;
  final void Function()? onTap;

  const Button({
    super.key,
    required this.name,
    required this.buttonColor,
    required this.buttonTextColor,
    this.borderbuttonColor,
    required this.buttonFonSize,
    this.buttonWidth, // Optionnel
    required this.onTap,
    this.isTransparent = false,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        width: widget.buttonWidth, // Utilisation de la largeur si fournie
        decoration: BoxDecoration(
          color: widget.buttonColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: widget.borderbuttonColor ?? Colors.transparent,
            width: 1, // Ajout d'un contour visible
          ),
        ),
        child: Text(
          widget.name,
          textAlign: TextAlign.center,
          style: AppTextStyles.poppinsMedium.copyWith(
            color: widget.buttonTextColor,
            fontSize: widget.buttonFonSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
