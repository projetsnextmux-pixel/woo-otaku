import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:woo/core/widgets/publication.dart';
import 'package:woo/core/widgets/video_player.dart';

// Assumons que AppColors est défini comme ceci pour cet exemple
class AppColors {
  static const Color primary = Color(0xFF3C4DF3); // Exemple de couleur primaire
  static const Color iconBackgroundInactive = Colors.white; // Fond blanc pour l'icône inactive
  static const Color iconBorderInactive = Colors.grey; // Bordure grise pour l'icône inactive
}

// Ces classes et fonctions sont des placeholders si elles ne sont pas fournies avec le code
// complet pour éviter les erreurs de compilation.
// Si vous avez les fichiers réels, assurez-vous que leurs imports sont corrects.
class ReactionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.blueGrey.withValues(alpha: 0.8),
      child: Center(child: Text('ReactionBar Placeholder', style: TextStyle(color: Colors.white))),
    );
  }
}
void showMasquer(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Action Masquer')),
  );
}
void showPopupListeOptions(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Action Options')),
  );
}
// Fin des placeholders

class CommentPage extends StatelessWidget {
  CommentPage({super.key});

  final List<Map<String, dynamic>> posts = [
    {
      "username": "@animeLover",
      "timeAgo": "À l'instant",
      "postDescription": "Regardez mon dernier cosplay de Naruto!",
      "hashtags": "#cosplay #naruto #anime",
      "likes": "120",
      "comments": "30",
      "imagePath": const AssetImage("images/animes.jpeg"), // Utilisation de const
    },
  ];

  final List<Map<String, dynamic>> comments = [
    {
      "username": "@user1",
      "comment": "C'est super bien fait !",
      "likes": "10",
      "subComments": [
        {
          "username": "@user2",
          "comment": "Ouais, vraiment impressionnant !",
          "likes": "5"
        },
      ],
    },
    {
      "username": "@user4",
      "comment": "J'adore ce cosplay!",
      "likes": "20",
      "subComments": [],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ----- POST WITH BACK BUTTON -----
            Expanded(
              child: ListView(
                children: [
                  Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Publication ou vidéo
                          posts[0]["imagePath"] is String
                              ? ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxHeight: 400,
                                  ),
                                  child: LocalVideoPlayer(
                                    videoPath: posts[0]["imagePath"],
                                    likesCount: posts[0]["likes"],
                                    commentsCount: posts[0]["comments"],
                                    showVisibilityIcon: false,
                                    showMoreOptionsIcon: false,
                                    borderRadius: const BorderRadius.vertical(
                                      bottom: Radius.circular(20),
                                    ),
                                  ),
                                )
                              : Publication(
                                  imageUrl: posts[0]["imagePath"],
                                  likesCount: posts[0]["likes"],
                                  commentsCount: posts[0]["comments"],
                                  showVisibilityIcon: false,
                                  showMoreOptionsIcon: false,
                                  borderRadius: const BorderRadius.vertical(
                                    bottom: Radius.circular(20),
                                  ),
                                ),

                          // Détails du post
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      posts[0]["username"],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      posts[0]["timeAgo"],
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(posts[0]["postDescription"]),
                                const SizedBox(height: 6),
                                Text(
                                  posts[0]["hashtags"],
                                  style:
                                      const TextStyle(color: AppColors.primary),
                                ),
                              ],
                            ),
                          ),

                          const Divider(color: Colors.grey),
                          const SizedBox(height: 8),

                          // Liste des commentaires
                          ...comments.map((c) => _buildCommentTile(c)),
                        ],
                      ),

                      // Bouton retour
                      Positioned(
                        top: 8,
                        left: 8,
                        child: CircleAvatar(
                          backgroundColor: Colors.black.withValues(alpha: 0.5),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.white),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ----- ZONE DE SAISIE -----
            _CommentInputBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildCommentTile(Map<String, dynamic> c) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ExpansionTile(
        leading: const CircleAvatar(
          backgroundImage: AssetImage(
              "images/5bd5fc17416c01761655b8e5335c6f03.jpg"),
        ),
        title: Text(c["username"],
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(c["comment"]),
            const SizedBox(height: 4),
            Text("${c["likes"]} likes",
                style:
                    const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
        children: (c["subComments"] as List)
            .map<Widget>((sc) => Padding(
                  padding: const EdgeInsets.only(left: 40, bottom: 8),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage(
                          "images/5bd5fc17416c01761655b8e5335c6f03.jpg"),
                    ),
                    title: Text(sc["username"],
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(sc["comment"]),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class _CommentInputBar extends StatefulWidget {
  @override
  _CommentInputBarState createState() => _CommentInputBarState();
}

class _CommentInputBarState extends State<_CommentInputBar> {
  final TextEditingController _ctrl = TextEditingController();
  bool _showExtras = false;
  bool _sendMode = false;
  bool _isAttachLongPressed = false;
  Timer? _longPressTimer;

  @override
  void initState() {
    super.initState();
    _ctrl.addListener(() {
      setState(() {
        _sendMode = _ctrl.text.trim().isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _longPressTimer?.cancel();
    _ctrl.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _ctrl.text.trim();
    if (text.isNotEmpty) {
      debugPrint("Message envoyé: $text");
      _ctrl.clear();
      setState(() {
        _sendMode = false;
        _isAttachLongPressed = false;
      });
    }
  }

  void _handleAttachLongPressStart(LongPressStartDetails details) {
    if (_ctrl.text.trim().isNotEmpty) {
      _longPressTimer?.cancel();
      _longPressTimer = Timer(const Duration(milliseconds: 300), () {
        if (mounted) {
          setState(() {
            _isAttachLongPressed = true;
          });
        }
      });
    }
  }

  void _handleAttachLongPressEnd(LongPressEndDetails details) {
    _longPressTimer?.cancel();

    if (_isAttachLongPressed && _ctrl.text.trim().isNotEmpty) {
      _sendMessage();
    }

    if (mounted) {
      setState(() {
        _isAttachLongPressed = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasText = _ctrl.text.trim().isNotEmpty;

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("images/avatar.jpg"),
          ),
          const SizedBox(width: 10),

          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _ctrl,
                      decoration: const InputDecoration(
                        hintText: 'Ajouter un commentaire',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: hasText ? _sendMessage : null,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      transitionBuilder: (child, animation) {
                        return ScaleTransition(scale: animation, child: child);
                      },
                      child: Icon(
                        _sendMode ? Icons.send : Icons.mic,
                        key: ValueKey(_sendMode),
                        color: _sendMode ? AppColors.primary : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),

          if (_showExtras)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _IconCircle(
                  icon: Icons.mic,
                  onTap: () => setState(() => _showExtras = false),
                  isActive: true, // Ces icônes sont toujours actives/bleues
                ),
                const SizedBox(height: 6),
                _IconCircle(
                  icon: Icons.emoji_emotions,
                  onTap: () => setState(() => _showExtras = false),
                  isActive: true, // Ces icônes sont toujours actives/bleues
                ),
                const SizedBox(height: 6),
                _IconCircle(
                  icon: Icons.image, // Changement pour mieux correspondre à l'icône de galerie/image
                  onTap: () => setState(() => _showExtras = false),
                  isActive: true, // Ces icônes sont toujours actives/bleues
                ), 
              ],
            )
          else
            GestureDetector(
              onLongPressStart: hasText ? _handleAttachLongPressStart : null,
              onLongPressEnd: hasText ? _handleAttachLongPressEnd : null,
              onDoubleTap: () => setState(() => _showExtras = true),
              onTap: () {
                debugPrint("Action d'attachement simple");
              },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: _IconCircle(
                  key: ValueKey(_isAttachLongPressed),
                  icon: _isAttachLongPressed ? Icons.send : Icons.attach_file,
                  isActive: _isAttachLongPressed, // L'icône est active seulement si elle est 'send'
                ),
              ),
            ),
        ],
      ),
    );
  }
}




class _IconCircle extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final bool isActive;

  const _IconCircle({
    super.key,
    required this.icon,
    this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.primary // Fond bleu pour les icônes actives (mic, emoji, send)
              : AppColors.iconBackgroundInactive, // Fond blanc/gris pour attach_file inactive
          shape: BoxShape.circle,
          border: isActive // Bordure seulement pour attach_file inactive
              ? null
              : Border.all(color: AppColors.iconBorderInactive, width: 1.5),
        ),
        child: Icon(
          icon,
          color: isActive ? Colors.white : AppColors.iconBorderInactive, // Icône blanche sur fond bleu, grise sur fond blanc
          size: 20,
        ),
      ),
    );
  }
}