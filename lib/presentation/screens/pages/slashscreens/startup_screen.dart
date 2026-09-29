import 'package:flutter/material.dart';


import 'package:woo/core/widgets/color.dart';
import 'welcome_screen.dart'; // Import de la page WelcomeScreen


class StartupScreen extends StatefulWidget {
  const StartupScreen({super.key});
  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  @override
  void initState() {
    super.initState();

    // Délai de 20 secondes avant de naviguer vers WelcomeScreen
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary, // Fond bleu
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              'images/logo.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),

            
          ],
        ),
      ),
    );
  }
}
