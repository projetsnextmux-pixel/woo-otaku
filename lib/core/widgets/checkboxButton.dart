import 'package:flutter/material.dart';

class CheckboxButtonWidget extends StatefulWidget {
  final Color buttonCheckBoxColor; // Le type doit être `Color` pour une couleur

  const CheckboxButtonWidget({
    super.key,
    required this.buttonCheckBoxColor, // On attend une couleur
  });

  @override
  
  _CheckboxButtonWidgetState createState() => _CheckboxButtonWidgetState();
}

class _CheckboxButtonWidgetState extends State<CheckboxButtonWidget> {
  List<bool> isChecked = [false, false, false, false]; // Liste des états des checkboxes

  // Fonction pour changer l'état des checkboxes
  void changeCheckbox(int index, bool? value) {
    setState(() {
      if (value != null) {
        isChecked[index] = value;
      }
    });
  }

  // Fonction pour générer dynamiquement les checkboxes
  Widget buttonCheckBox() {
    List<Widget> checkBoxWidgets = [];
    for (int i = 0; i < 1; i++) {
      checkBoxWidgets.add(
        Checkbox(
          activeColor: widget.buttonCheckBoxColor, // Utilisez widget pour accéder à la couleur
          value: isChecked[i],
          onChanged: (bool? value) {
            changeCheckbox(i, value); // Mettre à jour l'état
          },
        ),
      );
    }
    return Column(
      children: checkBoxWidgets, // Retourne la colonne avec les checkboxes
    );
  }

  @override
  Widget build(BuildContext context) {
    return buttonCheckBox(); // Affiche uniquement les checkboxes
  }
}












