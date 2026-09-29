import 'package:flutter/material.dart';
import 'package:woo/core/widgets/color.dart';

class FormFieldWidget extends StatefulWidget {
  final String? labelContent;
  final int? maxLengtText;
  final Widget? prefixIconWidget; // Icône pour le début du champ
  final Widget? suffixIconVisible; // Icône pour afficher le texte (facultatif)
  final Widget? suffixIconHidden; // Icône pour masquer le texte (facultatif)
  final void Function()? onTap;
  final bool isPasswordField; // Indique si le champ est un mot de passe
  final TextEditingController? controller;
  final String? Function(String?)? validator; // validator typé

  const FormFieldWidget({
    super.key,
    this.labelContent,
    this.maxLengtText,
    this.prefixIconWidget,
    this.suffixIconVisible,
    this.suffixIconHidden,
    this.onTap,
    this.isPasswordField = false,
    this.controller,
    this.validator,
  });

  @override
  State<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  bool _isPasswordVisible = false; // Contrôler la visibilité du mot de passe

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller, // <-- IMPORTANT : utilise le controller fourni
      onTap: widget.onTap,
      maxLength: widget.maxLengtText,
      keyboardType: widget.isPasswordField ? TextInputType.text : TextInputType.emailAddress,
      obscureText: widget.isPasswordField ? !_isPasswordVisible : false,
      style: const TextStyle(
        color: Colors.white,
      ),
      validator: widget.validator, // <-- IMPORTANT : on branche le validator
      decoration: InputDecoration(
        prefixIcon: widget.prefixIconWidget,
        // Suffix : si c'est un champ mot de passe, on met un bouton oeil ; sinon on affiche les icônes fournies
        suffixIcon: widget.isPasswordField
            ? IconButton(
                icon: _isPasswordVisible
                    ? (widget.suffixIconVisible ?? const Icon(Icons.visibility, color: Colors.white))
                    : (widget.suffixIconHidden ?? const Icon(Icons.visibility_off, color: Colors.white)),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )
            : (widget.suffixIconVisible ?? widget.suffixIconHidden), // si fournis, sinon null
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            color: AppColors.primary,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            color: Colors.white30,
            width: 2.0,
          ),
        ),
        fillColor: Colors.white30,
        filled: true,
        labelText: widget.labelContent,
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
