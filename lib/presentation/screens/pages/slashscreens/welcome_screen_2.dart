import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/core/widgets/customTextWidget.dart';
import 'package:woo/core/widgets/logoButton.dart';
import 'package:woo/presentation/screens/pages/auth_page/register_login.dart';

class WelcomeScreen2 extends StatefulWidget {
  /// délai avant navigation automatique (en secondes)
  final int autoNavigateAfter;
  const WelcomeScreen2({super.key, this.autoNavigateAfter = 3});

  @override
  State<WelcomeScreen2> createState() => _WelcomeScreen2State();
}

class _WelcomeScreen2State extends State<WelcomeScreen2> {
  Timer? _timer;
  bool _navigated = false;

  @override
  void initState() {
    super.initState();

    // Démarre le délai après le premier frame pour éviter l'erreur de build pendant la frame.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _timer = Timer(Duration(seconds: widget.autoNavigateAfter), () {
        if (!mounted) return;
        _goNext();
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _goNext() {
    if (_navigated) return;
    _navigated = true;

    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 900),
        pageBuilder: (_, __, ___) => const Register_loginPage(),
        transitionsBuilder: (context, animation, _, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0), // entrée depuis la droite (comme précédemment)
              end: Offset.zero,
            ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut)),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Image de fond + flou + fond blanc
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(color: Colors.white.withValues(alpha: 0.9)),
          ),

          // Texte en haut à gauche
          const Padding(
            padding: EdgeInsets.all(40.0),
            child: CustomTextWidget(
              content: "for our passion",
              color: AppColors.primary,
              fontFamily: "Poppins",
            ),
          ),

          // Bouton en bas à droite — toujours visible; clique déclenche la navigation immédiate
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: LogoButton(
                name: "Logo Button",
                onTap: () {
                  if (!_navigated) {
                    _timer?.cancel();
                    _goNext();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
