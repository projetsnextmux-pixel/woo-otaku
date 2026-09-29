import 'package:flutter/material.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/core/widgets/button.dart';
import 'package:woo/presentation/screens/pages/teamCreat1.dart';

class TeamCreatePage extends StatelessWidget {
  const TeamCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
      final colorScheme = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              centerTitle: true,
              leading: IconButton(
                icon:  Icon(Icons.arrow_back, color: colorScheme.onSurface),
                onPressed: () => Navigator.pop(context),
              ),
              title:  Text(
                'Nouveau groupe',
                style: TextStyle(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(height: 1, color: Colors.grey.shade300),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Nom du groupe
            Container(
              decoration: BoxDecoration(
                color: brightness == Brightness.dark ? Colors.grey.shade900 : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(25),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration:  InputDecoration(
                  icon: Icon(Icons.group,color: brightness == Brightness.dark ? Colors.grey.shade200 : Colors.black54),
                  hintText: 'Nom du groupe',
                  border: InputBorder.none,
                ),
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            // Description
            Container(
              height: 150, // taille fixe comme sur le visuel
              decoration: BoxDecoration(
                color: brightness == Brightness.dark ? Colors.grey.shade900 : Colors.grey.shade200,
    
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
              child: TextField(
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                  hintText: 'Ajouter une description',
                  border: InputBorder.none,
                ),
                style: const TextStyle(fontSize: 16),
              ),
            ),
                        const Spacer(),

            // Bouton Suivant
            Button(
              name: 'Suivant',
              buttonColor: AppColors.primary,
              buttonTextColor: colorScheme.surface,
              buttonWidth: double.infinity,
              buttonFonSize: 16,
              borderbuttonColor: AppColors.primary,
              onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TeamPhotoPage()),
                      );
                    },
            ),
          ],
        ),
      ),
    );
  }
}
