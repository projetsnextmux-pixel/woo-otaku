import 'dart:async';
import 'package:flutter/material.dart';
import 'package:woo/core/widgets/customTextWidget.dart';
import 'package:woo/core/widgets/logobutton.dart';
import 'package:woo/presentation/screens/pages/slashscreens/welcome_screen_2.dart';

class WelcomeScreen extends StatefulWidget {
  /// délai avant la navigation automatique (en secondes)
  final int autoNavigateAfter;
  const WelcomeScreen({super.key, this.autoNavigateAfter = 3});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _navigated = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // Démarre le délai après le premier frame pour éviter l'erreur "Build scheduled during frame".
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _timer = Timer(Duration(seconds: widget.autoNavigateAfter), () {
          if (!mounted) return;
          _goNext(); // navigation automatique
        });
      }
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
        pageBuilder: (_, __, ___) =>  WelcomeScreen2(),
        transitionsBuilder: (context, animation, _, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            )),
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
          // arrière-plan avec ombre noire
          Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("images/lesmangas.png"),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.9),
                  offset: const Offset(0, 9),
                  blurRadius: 30,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Container(color: Colors.black.withValues(alpha: 0.7)),
          ),

          // Texte en haut à gauche (inchangé)
          const Padding(
            padding: EdgeInsets.all(40.0),
            child: CustomTextWidget(
              content: "Word Of Otaku",
              fontFamily: 'Poppins',
            ),
          ),

          // LogoButton (toujours visible ; onTap déclenche aussi la navigation manuellement)
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: LogoButton(
                name: "Commencer",
                onTap: () {
                  // si l'utilisateur clique avant le délai, navigue immédiatement
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
