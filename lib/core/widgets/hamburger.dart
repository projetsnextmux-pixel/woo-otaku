import 'package:flutter/material.dart';
import 'package:woo/presentation/screens/pages/faq.dart';
import 'package:woo/presentation/screens/pages/feedback_page.dart';
import 'package:woo/presentation/screens/pages/parametre/language.dart';
import 'package:woo/presentation/screens/pages/parametre/manage_account.dart';
import 'package:woo/presentation/screens/pages/parametre/privacy_security.dart';
import 'package:woo/presentation/screens/pages/shareProfil.dart';

class Hamburger extends StatefulWidget {
  final Color backColor; // Couleur de fond par défaut
  final Color texteColor; // Couleur du texte par défaut
  final BorderRadius borderRadius; // Arrondi des bords
  final VoidCallback onTap; // Fonction pour gérer les clics
  final String version; // Texte de la version

  const Hamburger({
    Key? key,
    required this.backColor,
    required this.texteColor,
    required this.borderRadius,
    required this.onTap,
    required this.version,
  }) : super(key: key);

  @override
  State<Hamburger> createState() => _HamburgerState();
}

class _HamburgerState extends State<Hamburger> {
  bool isDarkTheme = false; // État initial pour le thème

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: isDarkTheme ? Colors.black : widget.backColor,
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header
            DrawerHeader(
              decoration: BoxDecoration(
                color: isDarkTheme ? Colors.grey[900] : widget.backColor,
                border: Border(
                  bottom: BorderSide(color: Colors.white, width: 1.0),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Paramètres',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isDarkTheme ? Colors.white : widget.texteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Thème Dark avec Switch
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Thème Dark',
                    style: TextStyle(
                      color: isDarkTheme ? Colors.white : widget.texteColor,
                      fontSize: 16,
                    ),
                  ),
                  Transform.scale(
                    scale: 0.6,
                    child: Switch(
                      value: isDarkTheme,
                      onChanged: (value) {
                        setState(() {
                          isDarkTheme = value;
                        });
                      },
                      activeColor: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),

            // Boutons pour naviguer vers les pages
            _buildTextButton('Gérer mon compte', isDarkTheme, ComptePage()),
            _buildTextButton(
                'Confidentialité et sécurité', isDarkTheme, ConfidentialitePage()),
            _buildTextButton('Partager le profil', isDarkTheme, ShareProfil()),
            _buildTextButton('FAQ Woo', isDarkTheme, FaqPage()),
            _buildTextButton(
                'Aidez-nous à améliorer Woo', isDarkTheme, FeedbackPage()),
            _buildTextButton('Langue', isDarkTheme, LanguePage()),
            _buildTextButton('Ajouter un compte', isDarkTheme, FaqPage()),
            _buildTextButton('Déconnexion', isDarkTheme, FaqPage()),

            // Texte de la version
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Center(
                child: Text(
                  widget.version,
                  style: TextStyle(
                    color: (isDarkTheme ? Colors.white : widget.texteColor)
                        .withValues(alpha: 0.5),
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Méthode pour créer un TextButton
  Widget _buildTextButton(String title, bool isDarkTheme, Widget route) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: isDarkTheme ? Colors.white : widget.texteColor, padding: EdgeInsets.symmetric(vertical: 12.0),
          alignment: Alignment.centerLeft,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => route),
          );
        },
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: isDarkTheme ? Colors.white : widget.texteColor,
          ),
        ),
      ),
    );
  }
}
