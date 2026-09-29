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
import 'package:woo/core/services/auth_service.dart';



class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController =
      TextEditingController(); // added
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _showPassword = false;
  bool _acceptTerms = false;
  bool _loading = false;
  Map<String, dynamic>? _errors;

  void _showSnack(String text) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));

  Future<void> _submit() async {
    if (_formKey.currentState != null && !_formKey.currentState!.validate())
      return;
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
      await AuthService.register(
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
      _showSnack('Inscription réussie');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => ProfileImagePage()),
      );
    } catch (err) {
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
                    suffixIconVisible: Icon(
                      Icons.check_circle_sharp,
                      color: Colors.green,
                      size: 24,
                    ),
                    suffixIconHidden: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Le “fond” rouge
                          Icon(
                            Icons.warning_amber_rounded,
                            color: Colors.red,
                            size: 24,
                          ),
                          // La “bordure” blanche, un peu plus petite
                          Icon(
                            Icons.warning_rounded,
                            color: Colors.white,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),

                  const SizedBox(height: 16),

                  FormFieldWidget(
                    controller: _passwordController,
                    labelContent: 'Mot de passe',
                    maxLengtText: 20,
                    prefixIconWidget: Icon(Icons.lock, color: Colors.white),
                    // isPasswordField: true,
                    validator: (s) {
                      if (s == null || s.length < 6)
                        return 'Mot de passe min 6 caractères';
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  FormFieldWidget(
                    controller: _confirmPasswordController,
                    labelContent: 'Confirmer le mot de passe',
                    maxLengtText: 20,
                    prefixIconWidget: Icon(Icons.lock, color: Colors.white),
                    // isPasswordField: true,
                    suffixIconVisible: Icon(
                      Icons.check_circle_sharp,
                      color: Colors.green,
                      size: 24,
                    ),
                    suffixIconHidden: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Le “fond” rouge
                          Icon(
                            Icons.warning_amber_rounded,
                            color: Colors.red,
                            size: 24,
                          ),
                          // La “bordure” blanche, un peu plus petite
                          Icon(
                            Icons.warning_rounded,
                            color: Colors.white,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                    validator: (s) {
                      if (s == null || s.isEmpty)
                        return 'Confirmez le mot de passe';
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

                  const SizedBox(height: 20),
                  Center(
                    child: Button(
                      name: 'Suivant',
                      buttonColor: AppColors.primary,
                      buttonTextColor: colorScheme.surface,
                      buttonWidth: double.infinity,
                      buttonFonSize: 15,
                      borderbuttonColor: Colors.white,
                      onTap: (){Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileImagePage(),
                        ),
                      );},
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
