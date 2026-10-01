// lib/presentation/screens/pages/auth_page/login.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:woo/core/widgets/button.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/core/widgets/formfield.dart';
import 'package:woo/presentation/screens/pages/auth_page/register.dart';
import 'package:woo/presentation/screens/pages/news.dart';
import 'package:woo/presentation/screens/pages/slashscreens/recovery.dart';
import 'package:woo/core/services/auth_service.dart';
import 'package:woo/data/models/user.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _loading = false;
  Map<String, dynamic>? _errors;

  void _showSnack(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Future<void> _submit() async {
    if (_formKey.currentState != null && !_formKey.currentState!.validate()) {
      return;
    }

    if (!mounted) return;
    setState(() {
      _loading = true;
      _errors = null;
    });

    try {
      final user = await AuthService.login(
        pseudo: _emailController.text.trim(),
        password: _passwordController.text,
      );

      if (!mounted) return;

      _showSnack('Connexion réussie ! Bienvenue ${user.pseudo}');

      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const NewsPage()),
          (route) => false,
        );
      });
    } catch (err) {
      if (!mounted) return;
      setState(() {
        _loading = false;
      });

      if (err is Map) {
        setState(() {
          _errors = Map<String, dynamic>.from(err);
        });
        if (err['message'] != null) _showSnack(err['message'].toString());
      } else {
        _showSnack(err.toString());
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Stack(
        children: [
          // Image de fond
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/lesmangas.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(color: Colors.black.withValues(alpha: 0.6)),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(height: 150),
                  Center(
                    child: Text(
                      "Connexion",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Email / Pseudo field
                  FormFieldWidget(
                    controller: _emailController,
                    labelContent: 'Pseudonyme',
                    maxLengtText: 30,
                    prefixIconWidget: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 5,
                        left: 8,
                        top: 8,
                      ),
                      child: FaIcon(
                        FontAwesomeIcons.at,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Veuillez saisir votre pseudonyme';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  FormFieldWidget(
                    controller: _passwordController,
                    labelContent: 'Mot de passe',
                    maxLengtText: 20,
                    prefixIconWidget: const Icon(Icons.lock, color: Colors.white),
                    isPasswordField: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez saisir votre mot de passe';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),
                  if (_errors != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (_errors!['message'] != null)
                            Text(
                              _errors!['message'].toString(),
                              style: const TextStyle(color: Colors.red),
                            ),
                          if (_errors!['errors'] != null)
                            for (var e in (_errors!['errors'] as Map).entries)
                              Text(
                                '${e.key}: ${(e.value as List).join(", ")}',
                                style: const TextStyle(color: Colors.red),
                              ),
                        ],
                      ),
                    ),

                  const SizedBox(height: 20),

                  Center(
                    child: Button(
                      name: _loading ? 'Connexion...' : 'Connexion',
                      buttonColor: AppColors.primary,
                      buttonTextColor: colorScheme.surface,
                      buttonWidth: double.infinity,
                      buttonFonSize: 15,
                      borderbuttonColor: Colors.white,
                      onTap: _loading ? () {} : _submit,
                    ),
                  ), 

                  const SizedBox(height: 20),

                  Center(
                    child: GestureDetector(
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterPage(),
                            ),
                          ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Tu n'as pas un compte ?  ",
                              style: TextStyle(color: Colors.white),
                            ),
                            TextSpan(
                              text: "S'inscrire",
                              style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
