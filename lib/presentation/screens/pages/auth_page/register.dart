// lib/presentation/screens/pages/auth_page/register.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:woo/core/widgets/button.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/core/widgets/formfield.dart';
import 'package:woo/presentation/screens/pages/add_profile_photo.dart';
import 'package:woo/presentation/screens/pages/condition.dart';
import 'package:woo/presentation/screens/pages/auth_page/login.dart';
import 'package:woo/presentation/screens/pages/news.dart';
import 'package:woo/core/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _showPassword = false;
  bool _acceptTerms = false;
  bool _loading = false;
  Map<String, dynamic>? _errors;

  void _showSnack(String text) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));

  Future<void> _submit() async {
    if (_formKey.currentState != null && !_formKey.currentState!.validate()) {
      return;
    }
    if (!_acceptTerms) {
      _showSnack("Vous devez accepter les conditions d'utilisation.");
      return;
    }
    if (_passwordController.text != _confirmPasswordController.text) {
      _showSnack("Les mots de passe ne correspondent pas.");
      return;
    }
    setState(() {
      _loading = true;
      _errors = null;
    });
    try {
      final user = await AuthService.register(
        pseudo: _usernameController.text.trim(),
        password: _passwordController.text,
        passwordConfirmation: _confirmPasswordController.text,
        age: 18,
        gender: 'male',
        country: 'FR',
        question1: 'Anime préféré ?',
        answer1: 'Otaku',
        question2: 'Manga préféré ?',
        answer2: 'Otaku',
        question3: 'Perso préféré ?',
        answer3: 'Otaku',
      );
      _showSnack('Inscription réussie ! Bienvenue ${user.pseudo}');
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const NewsPage()),
        (route) => false,
      );
    } catch (err) {
      if (!mounted) return;
      setState(() {
        _loading = false;
      });
      if (err is Map) {
        setState(() {
          _errors = err as Map<String, dynamic>?;
        });
        if (err['message'] != null) _showSnack(err['message'].toString());
      } else {
        _showSnack(err.toString());
      }
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Stack(
        children: [
          // bg
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
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      "Inscription",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  FormFieldWidget(
                    controller: _usernameController,
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
                    validator: (s) {
                      if (s == null || s.trim().isEmpty) {
                        return 'Veuillez entrer un pseudonyme';
                      }
                      if (s.trim().length < 3) {
                        return 'Le pseudo doit faire au moins 3 caractères';
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
                    isPasswordField: !_showPassword,
                    validator: (s) {
                      if (s == null || s.length < 8) {
                        return 'Mot de passe min 8 caractères';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  FormFieldWidget(
                    controller: _confirmPasswordController,
                    labelContent: 'Confirmer le mot de passe',
                    maxLengtText: 20,
                    prefixIconWidget: const Icon(Icons.lock, color: Colors.white),
                    isPasswordField: !_showPassword,
                    validator: (s) {
                      if (s == null || s.isEmpty) {
                        return 'Confirmez le mot de passe';
                      }
                      if (s != _passwordController.text) {
                        return 'Les mots de passe ne correspondent pas';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: _showPassword,
                        onChanged:
                            (v) => setState(() => _showPassword = v ?? false),
                        activeColor: Colors.green,
                        side: const BorderSide(color: Colors.white, width: 2),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Afficher le mot de passe',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Checkbox(
                        value: _acceptTerms,
                        onChanged:
                            (value) =>
                                setState(() => _acceptTerms = value ?? false),
                        activeColor: Colors.green,
                        side: const BorderSide(color: Colors.white, width: 2),
                      ),
                      GestureDetector(
                        onTap:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Condition(),
                              ),
                            ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "J'accepte les ",
                                style: TextStyle(color: Colors.white),
                              ),
                              TextSpan(
                                text: "Conditions d'utilisation",
                                style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(
                                text: " de WOO",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
                      name: _loading ? 'Inscription...' : 'S\'inscrire',
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
                              builder: (context) => LoginPage(),
                            ),
                          ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Tu as déjà un compte ?  ",
                              style: TextStyle(color: Colors.white),
                            ),
                            TextSpan(
                              text: "Se connecter",
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
