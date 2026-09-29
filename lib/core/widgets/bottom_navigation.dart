import 'package:flutter/material.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // On applique un Theme pour personnaliser splash/hover
    return Theme(
      data: Theme.of(context).copyWith(
        // Splash (press) et hover color
        splashColor: Colors.grey.shade200,
        hoverColor: Colors.grey.shade200,
      ),
      child: BottomNavigationBar(
        // backgroundColor: AppColors.white,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: onItemTapped,

        // Couleurs des icônes
        selectedItemColor: AppColors.primary,         // bleu
        unselectedItemColor: Colors.blueGrey.shade200, // gris foncé

        // On force aussi l’IconTheme pour que les SVG héritent bien
        selectedIconTheme: IconThemeData(color: AppColors.primary),
        unselectedIconTheme: IconThemeData(color: Colors.blueGrey.shade200),

        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'icons/bouton_menu_home.svg',
              color: selectedIndex == 0
                  ? AppColors.primary
                  : Colors.blueGrey.shade200,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'icons/bouton_menu_message.svg',
              color: selectedIndex == 1
                  ? AppColors.primary
                  : Colors.blueGrey.shade200,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_rounded,
              size: 40,
              color: selectedIndex == 2
                  ? AppColors.primary
                  : Colors.blueGrey.shade200,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'icons/bouton_menu_notifications.svg',
              color: selectedIndex == 3
                  ? AppColors.primary
                  : Colors.blueGrey.shade200,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'icons/bouton_menu_profil.svg',
              color: selectedIndex == 4
                  ? AppColors.primary
                  : Colors.blueGrey.shade200,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
