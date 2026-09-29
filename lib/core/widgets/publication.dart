import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:woo/presentation/screens/pages/comment.dart';


import 'package:share_plus/share_plus.dart';

class Publication extends StatefulWidget {
  final void Function()? onTap;
  final String likesCount;
  final String commentsCount;
  final AssetImage imageUrl;

  // Chemins vers vos SVG dans assets/icons/
  final String likeIconAsset;
  final String commentIconAsset;
  final String shareIconAsset;
  final String downloadIconAsset;

  final bool showLikeIcon;
  final bool showCommentIcon;
  final bool showShareIcon;
  final bool showDownloadIcon;
  final bool showVisibilityIcon;
  final bool showMoreOptionsIcon;
  final BorderRadius borderRadius;

  const Publication({
    Key? key,
    required this.likesCount,
    required this.commentsCount,
    required this.imageUrl,
    this.onTap,
    this.likeIconAsset          = 'icons/icon_like_appliqué.svg',
    this.commentIconAsset       = 'icons/icon_commentaire.svg',
    this.shareIconAsset         = 'icons/icon_partager.svg',
    this.downloadIconAsset      = 'icons/icon_telecharger.svg',
    this.showLikeIcon           = true,
    this.showCommentIcon        = true,
    this.showShareIcon          = true,
    this.showDownloadIcon       = true,
    this.showVisibilityIcon     = true,
    this.showMoreOptionsIcon    = true,
    this.borderRadius           = const BorderRadius.all(Radius.circular(20)),
  }) : super(key: key);

  @override
  State<Publication> createState() => _PublicationState();
}

class _PublicationState extends State<Publication> {
  bool _showReactionBar = false;

  void _toggleReactionBar() {
    setState(() {
      _showReactionBar = !_showReactionBar;
    });
  }

  void _shareContent(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      final shareMessage = "Découvrez cette publication Otaku!\n"
          "👍 ${widget.likesCount} likes • 💬 ${widget.commentsCount} commentaires\n"
          "#Otaku #Anime #Cosplay";

      await Share.share(
        shareMessage,
        subject: 'Publication Otaku à découvrir',
      );

      debugPrint("Publication partagée");
    } catch (e) {
      messenger.showSnackBar(
        SnackBar(content: Text("Erreur de partage: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: ClipRRect(
              borderRadius: widget.borderRadius,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  // Image principale
                  SizedBox(
                    width: double.infinity,
                    child: Image(
                      image: widget.imageUrl,
                      fit: BoxFit.cover,
                      height: 200,
                    ),
                  ),

                  // Barre de réaction (long press like)
                  if (_showReactionBar)
                    Positioned(
                      bottom: 50,
                      left: 0,
                      right: 0,
                      child: ReactionBar(),
                    ),

                  // Bande d'actions
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withValues(alpha: 0.7),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Row(
                          children: [
                            // ─── Like ───
                            if (widget.showLikeIcon) ...[
                              GestureDetector(
                                onLongPress: _toggleReactionBar,
                                child: SvgPicture.asset(
                                  widget.likeIconAsset,
                                  width: 20,
                                  height: 20,
                                  colorFilter: ColorFilter.mode(
                                    AppColors.primary,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                widget.likesCount,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],

                            // ─── Comment ───
                            if (widget.showCommentIcon) ...[
                              const SizedBox(width: 12),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => CommentPage(),
                                    ),
                                  );
                                },
                                icon: SvgPicture.asset(
                                  widget.commentIconAsset,
                                  width: 20,
                                  height: 20,
                                  colorFilter: ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                              Text(
                                widget.commentsCount,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],

                            // ─── Share ───
                            if (widget.showShareIcon) ...[
                              const SizedBox(width: 12),
                              IconButton(
                                onPressed: () => _shareContent(context),
                                icon: SvgPicture.asset(
                                  widget.shareIconAsset,
                                  width: 20,
                                  height: 20,
                                  colorFilter: ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ],

                            // ─── Spacer pour pousser download à droite ───
                            const Spacer(),

                            // ─── Download ───
                            if (widget.showDownloadIcon)
                              IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  widget.downloadIconAsset,
                                  width: 20,
                                  height: 20,
                                  colorFilter: ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Visibility (icône Material)
                  if (widget.showVisibilityIcon)
                    Positioned(
                      top: 5,
                      left: 16,
                      child: IconButton(
                        onPressed: () => showMasquer(context),
                        icon: const Icon(Icons.visibility_off_outlined, color: Colors.white),
                      ),
                    ),

                  // More options (icône Material)
                  if (widget.showMoreOptionsIcon)
                    Positioned(
                      top: 5,
                      right: 16,
                      child: IconButton(
                        onPressed: () => showPopupListeOptions(context),
                        icon: const Icon(Icons.more_horiz, color: Colors.white),
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
