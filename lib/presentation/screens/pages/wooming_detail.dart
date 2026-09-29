import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:woo/core/widgets/color.dart';

class WoomingDetailPage extends StatefulWidget {
  const WoomingDetailPage({super.key});
  @override
  State<WoomingDetailPage> createState() => _WoomingDetailPageState();
}

class _WoomingDetailPageState extends State<WoomingDetailPage> {
  final List<Map<String, String>> _comments = [
    {
      'avatar': 'images/animes.jpeg',
      'username': '@pseudo',
      'text':
          'Wow! Just amazing. I love your profile content. Look forward to see more.',
    },
    {
      'avatar': 'images/animes.jpeg',
      'username': 'User123',
      'text': 'Rhoncus ipsum eget tempus. Praesent consectetur fermentum…',
    },
  ];
  final TextEditingController _commentController = TextEditingController();
  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('images/fille.jpeg', fit: BoxFit.cover),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundImage: AssetImage('images/n1.png'),
                  ),
                  const SizedBox(width: 6),
                  const Icon(Icons.remove_red_eye_outlined,
                      color: Colors.white, size: 15),
                  const SizedBox(width: 6),
                  const Text('55M',
                      style: TextStyle(color: Colors.white, fontSize: 10)),
                ]),
              ),
            ),
          ),

          // Zone floutée des commentaires & saisie
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black54, Colors.black38, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                          reverse: true,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          itemCount: _comments.length,
                          itemBuilder: (ctx, i) {
                            final c = _comments[i];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 16,
                                    backgroundImage: AssetImage(c['avatar']!),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withValues(alpha: 0.1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                            text: c['username'],
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const TextSpan(text: ' '),
                                          TextSpan(
                                            text: c['text'],
                                            style: const TextStyle(
                                                color: Colors.white70),
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Row(children: [
                          Expanded(
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextField(
                                controller: _commentController,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  hintText: 'Ajouter un commentaire',
                                  hintStyle: TextStyle(color: Colors.white54),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              if (_commentController.text.trim().isEmpty) return;
                              setState(() {
                                _comments.insert(0, {
                                  'avatar': 'images/animes.jpeg',
                                  'username': '@moi',
                                  'text': _commentController.text.trim(),
                                });
                                _commentController.clear();
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primary,
                              ),
                              child: const Icon(Icons.send, color: Colors.white),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
