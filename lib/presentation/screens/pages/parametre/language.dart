import 'package:flutter/material.dart';
import 'package:woo/core/widgets/color.dart';

class LanguePage extends StatefulWidget {
  const LanguePage({super.key});
  @override
  State<LanguePage> createState() => _LanguePageState();
}

class _LanguePageState extends State<LanguePage> {
  // List of languages
  final List<String> languages = [
    'Français',
    'Anglais',
    'Español',
    'Deutsch',
    'Italiano',
    'Português',
    'Tagalog',
    'Русский',
    'العربية',
    '日本人',
    '中文',
  ];

  // Track selected language
  String selectedLanguage = 'Français';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('Langue'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.white,
      ),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(languages[index]),
            trailing: selectedLanguage == languages[index]
                ? Icon(Icons.check, color: AppColors.primary)
                : null,
            onTap: () {
              setState(() {
                selectedLanguage = languages[index];
              });
            },
          );
        },
      ),
    );
  }
}
