import 'dart:io';
import 'package:flutter/material.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/core/widgets/button.dart';
import 'package:woo/presentation/screens/pages/teamCreat2.dart';
import 'package:woo/presentation/screens/pages/teamCreat3.dart';

class TeamPhotoPage extends StatefulWidget {
  const TeamPhotoPage({super.key});

  @override
  State<TeamPhotoPage> createState() => _TeamPhotoPageState();
}

class _TeamPhotoPageState extends State<TeamPhotoPage> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    final path = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (_) => TeamGalleryPage()),
    );
    if (path != null && mounted) {
      setState(() {
        _selectedImage = File(path);
      });
    }
  }

  void _onNextPressed() {
    if (_selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez  sélectionner une image avant de continuer')),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TeamCreate3Page(initialImage: _selectedImage!),
        ),
      );
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
              title:  Text(
                'Photo du groupe',
                style: TextStyle(
                  color: brightness == Brightness.dark ? Colors.white : Colors.black,
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey.shade400,
                    backgroundImage: _selectedImage != null
                        ? FileImage(_selectedImage!)
                        : null,
                    child: _selectedImage == null
                        ?  Icon(
                            Icons.group,
                            size: 60,
                            color: colorScheme.surface,
                          )
                        : null,
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
              'Ajouter une photo de groupe',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const Spacer(),
            Button(
              name: 'Suivant',
              buttonColor: AppColors.primary,
              buttonTextColor: colorScheme.surface,
              buttonWidth: double.infinity,
              buttonFonSize: 16,
              borderbuttonColor: AppColors.primary,
              onTap: _onNextPressed,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
