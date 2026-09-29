import 'dart:io';
import 'package:flutter/material.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/core/widgets/button.dart';
import 'package:woo/presentation/screens/pages/teamCreat2.dart';

class TeamCreate3Page extends StatefulWidget {
  final File initialImage;

  const TeamCreate3Page({super.key, required this.initialImage});

  @override
  State<TeamCreate3Page> createState() => _TeamCreate3PageState();
}

class _TeamCreate3PageState extends State<TeamCreate3Page> {
  late File _currentImage;

  @override
  void initState() {
    super.initState();
    _currentImage = widget.initialImage;
  }

  Future<void> _pickImage() async {
    final path = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (_) => TeamGalleryPage()),
    );
    if (path != null && mounted) {
      setState(() => _currentImage = File(path));
    }
  }

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
              title: Text(
                'Modifier le groupe',
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
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey.shade400,
                    backgroundImage: FileImage(_currentImage),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          size: 20,
                          color: colorScheme.surface,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Modifier la photo du groupe',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color:   brightness == Brightness.dark ? Colors.grey.shade900 : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(25),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child:  TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.group, color: brightness == Brightness.dark ? Colors.grey.shade200 : Colors.black54),
                  hintText: 'Nom du groupe',
                  border: InputBorder.none,
                ),
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: brightness == Brightness.dark ? Colors.grey.shade900 : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
              child: const TextField(
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: 'Ajouter une description',
                  border: InputBorder.none,
                ),
                style: TextStyle(fontSize: 16),
              ),
            ),
            const Spacer(),
            Button(
              name: 'Suivant',
              buttonColor: AppColors.primary,
              buttonTextColor: colorScheme.surface,
              buttonWidth: double.infinity,
              buttonFonSize: 16,
              borderbuttonColor: AppColors.primary,
              onTap: () {
                // Action Suivant
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
