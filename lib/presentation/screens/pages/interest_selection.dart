import 'package:flutter/material.dart';
import 'package:woo/core/widgets/button.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/presentation/screens/pages/news.dart';



class InterestSelectionPage extends StatefulWidget {
  const InterestSelectionPage({super.key});
  @override
  State<InterestSelectionPage> createState() => _InterestSelectionPageState();
}

class _InterestSelectionPageState extends State<InterestSelectionPage> {
  final List<String> interests = [
    'Anime', 'Manga', 'Cosplay', 'Évènements', 'Comics', 'Figurines',
    'Culture Japonaise', 'Produits dérivés', 'Art et création', 'Musique',
    'Fan art', 'Fanfiction', 'Gadgets', 'Technologies',
    'Actualités de l\'industrie', 'Histoire', 'Analyse',
    'Communauté et soutien', 'Débats et théories', 'Mode et style',
    'Gaming', 'Light Novel', 'Manhwa', 'Manhua', 'Doujinshi',
    'Webtoon', 'Jeux de rôle', 'Cinéma japonais', 'J-Pop', 'J-Rock',
  ];

  final Map<String, bool> selectedInterests = {};

  @override
  void initState() {
    super.initState();
    for (var interest in interests) {
      selectedInterests[interest] = false;
    }
  }

  List<Widget> _buildJustifiedRows(ColorScheme colorScheme) {
    const int perRow = 3;
    final List<Widget> rows = [];
    for (int i = 0; i < interests.length; i += perRow) {
      final rowItems = interests.sublist(i, (i + perRow).clamp(0, interests.length));
      rows.add(
        Row(
          children: List.generate(perRow, (j) {
            if (j < rowItems.length) {
              final interest = rowItems[j];
              final isSelected = selectedInterests[interest] ?? false;
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: j == 0 ? 0 : 5,
                    right: j == rowItems.length - 1 ? 0 : 5,
                  ),
                  child: Button(
                    name: interest,
                    buttonColor: isSelected ? AppColors.primary : colorScheme.surface,
                    buttonTextColor: isSelected ? Colors.white : AppColors.primary,
                    borderbuttonColor: AppColors.primary,
                    buttonFonSize: 12,
                    onTap: () => _handleInterestSelection(interest),
                  ),
                ),
              );
            } else {
              return const Expanded(child: SizedBox());
            }
          }),
        ),
      );
      rows.add(const SizedBox(height: 10));
    }
    return rows;
  }

  void _handleInterestSelection(String interest) {
    setState(() {
      selectedInterests[interest] = !(selectedInterests[interest] ?? false);
    });
  }

  void _handleFinishSelection() {
    final selected = selectedInterests.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    if (selected.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez sélectionner au moins un centre d\'intérêt.'),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Centres d\'intérêt sélectionnés'),
        content: SingleChildScrollView(
          child: Text(selected.join(', ')),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Fermer la dialog
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewsPage()),
              );
            },
            child: Text('OK',
            style: TextStyle(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
            final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Centres d\'intérêt'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 15,
          color: colorScheme.onSurface,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 6,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Sélectionnez tes centres d'intérêt",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: _buildJustifiedRows(colorScheme),
                  ),
                  const SizedBox(height: 80), // Espace pour le bouton fixe
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
            child: Button(
              name: 'Terminer',
              buttonColor: AppColors.primary,
              buttonTextColor: colorScheme.surface,
              buttonFonSize: 16,
              onTap: _handleFinishSelection,
            ),
          ),
        ],
      ),
    );
  }
}