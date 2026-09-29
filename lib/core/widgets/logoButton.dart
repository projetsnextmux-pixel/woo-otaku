import 'package:flutter/material.dart';

class LogoButton extends StatefulWidget {
  final String name;
  final double? buttonSize; // Nouvelle propriété pour ajuster la taille
  final void Function()? onTap;

  const LogoButton({
    super.key,
    required this.name,
    this.buttonSize, // Optionnel
    required this.onTap,
  });

  @override
  State<LogoButton> createState() => _LogoButtonState();
}

class _LogoButtonState extends State<LogoButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.buttonSize ?? 65, // Taille par défaut si non spécifiée
      height: widget.buttonSize ?? 65,
      child: FloatingActionButton(
        onPressed: widget.onTap,
        child: Image.asset(
          'images/logo.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
