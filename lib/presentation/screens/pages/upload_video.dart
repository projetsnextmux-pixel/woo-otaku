// upload_video.dart
import 'package:flutter/material.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/presentation/screens/pages/create_news.dart';


class UploadVideo extends StatefulWidget {
  /// Chemin de la vidéo à uploader.
  final String videoPath;

  const UploadVideo({
    super.key,
    required this.videoPath,
  });

  @override
  State<UploadVideo> createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _startUpload();
  }

  /// Simule un upload ; remplacez par votre logique réelle.
  void _startUpload() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 200));
      if (!mounted) return false;
      setState(() {
        _progress = (_progress + 0.1).clamp(0.0, 1.0);
      });
      // Dès qu’on atteint 1.0, on sort de la boucle et on navigue
      if (_progress >= 1.0) {
        // On attend un court délai pour que l’utilisateur voie 100%
        await Future.delayed(const Duration(milliseconds: 300));
        if (!mounted) return false;
        // Remplace la route courante par CreatePage
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) =>  CreatePage()),
        );
        return false;
      }
      return true;
    });
  }

  void _cancelUpload() {
    // TODO : annulez vraiment l’upload si vous avez une API
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
        final colorScheme = Theme.of(context).colorScheme;
  
    final percent = (_progress * 100).toInt();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: Text(
          'Enregistrement en cours',
          style: TextStyle(color: colorScheme.onSurface, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: Colors.grey.shade200, height: 1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Text(
              'Téléchargement de la vidéo',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            const Text(
              'Merci de patienter…',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 32),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: _progress,
                minHeight: 12,
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '$percent %',
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _cancelUpload,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child:  Text(
                  'Annuler',
                  style: TextStyle(
                      fontSize: 16,
                      color: colorScheme.surface,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
