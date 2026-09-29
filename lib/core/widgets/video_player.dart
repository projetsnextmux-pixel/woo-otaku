import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:woo/presentation/screens/pages/comment.dart';
import 'package:share_plus/share_plus.dart';

class LocalVideoPlayer extends StatefulWidget {
  final String videoPath;
  final String likesCount;
  final String commentsCount;

  // Chemins vers vos SVG
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

  const LocalVideoPlayer({
    Key? key,
    required this.videoPath,
    required this.likesCount,
    required this.commentsCount,
    this.likeIconAsset = 'icons/icon_like_appliqué.svg',
    this.commentIconAsset = 'icons/icon_commentaire.svg',
    this.shareIconAsset = 'icons/icon_partager.svg',
    this.downloadIconAsset = 'icons/icon_telecharger.svg',
    this.showLikeIcon = true,
    this.showCommentIcon = true,
    this.showShareIcon = true,
    this.showDownloadIcon = true,
    this.showVisibilityIcon = true,
    this.showMoreOptionsIcon = true,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
  }) : super(key: key);

  @override
  State<LocalVideoPlayer> createState() => _LocalVideoPlayerState();
}

class _LocalVideoPlayerState extends State<LocalVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  bool _showPlayButton = true;
  Timer? _hidePlayButtonTimer;
  bool _showReactionBar = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) => setState(() {}));
  }

  @override
  void dispose() {
    _hidePlayButtonTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (!_controller.value.isInitialized) return;

    if (_controller.value.isPlaying) {
      _controller.pause();
      _showPlayButton = true;
    } else {
      _controller.play();
      _showPlayButton = true;
      _hidePlayButtonTimer?.cancel();
      _hidePlayButtonTimer = Timer(const Duration(seconds: 3), () {
        setState(() => _showPlayButton = false);
      });
    }
    setState(() => _isPlaying = _controller.value.isPlaying);
  }

  void _toggleReactionBar() =>
      setState(() => _showReactionBar = !_showReactionBar);

  void _pauseVideoOnScroll() {
    if (_controller.value.isPlaying) {
      _controller.pause();
      setState(() {
        _isPlaying = false;
        _showPlayButton = true;
      });
    }
  }


  void _shareContent(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      final shareMessage = "Regardez cette vidéo incroyable!\n"
          "👍 ${widget.likesCount} likes • 💬 ${widget.commentsCount} commentaires\n"
          "#Otaku #Anime #Cosplay";

      await Share.share(
        shareMessage,
        subject: 'Vidéo Otaku à découvrir',
      );

      debugPrint("Contenu partagé: ${widget.videoPath}");
    } catch (e) {
      messenger.showSnackBar(
        SnackBar(content: Text("Erreur de partage: ${e.toString()}")),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePlayPause,
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        child: ClipRRect(
          borderRadius: widget.borderRadius,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Vidéo
              if (_controller.value.isInitialized)
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),

              // Barre de progression
              if (_controller.value.isInitialized)
                Positioned(
                  bottom: 23,
                  left: 0,
                  right: 0,
                  child: VideoProgressIndicator(
                    _controller,
                    allowScrubbing: true,
                    colors: VideoProgressColors(
                      playedColor: AppColors.primary,
                      backgroundColor: Colors.grey,
                      bufferedColor: Colors.white,
                    ),
                  ),
                ),

              // Bouton play/pause
              if (_showPlayButton)
                Center(
                  child: IconButton(
                    onPressed: _togglePlayPause,
                    icon: Icon(
                      _isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                      size: 60,
                    ),
                  ),
                ),

              // Barre de réactions
              if (_showReactionBar)
                Positioned(bottom: 50, left: 0, right: 0, child: ReactionBar()),

              // Actions (like, comment, share, download)
              if (widget.showLikeIcon ||
                  widget.showCommentIcon ||
                  widget.showShareIcon ||
                  widget.showDownloadIcon)
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

                    // … dans votre Positioned(bottom: 0, left: 0, right: 0) …
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          // Groupe des 3 icônes : like, comment, share
                          if (widget.showLikeIcon)
                            GestureDetector(
                              onLongPress: _toggleReactionBar,
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    widget.likeIconAsset,
                                    width: 20,
                                    height: 20,
                                    colorFilter: ColorFilter.mode(
                                      AppColors.primary,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    widget.likesCount,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),

                          if (widget.showCommentIcon) ...[
                            const SizedBox(width: 12),
                            SvgPicture.asset(
                              widget.commentIconAsset,
                              width: 20,
                              height: 20,
                              colorFilter: ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.commentsCount,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],

                          if (widget.showShareIcon) ...[
  const SizedBox(width: 12),
  GestureDetector(
    onTap: () {
      _pauseVideoOnScroll();
      _shareContent(context);
    },
    child: SvgPicture.asset(
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

                          const Spacer(), // pousse le download à l'extrême droite
                          // Download
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

              // Visibilité (icône Material)
              if (widget.showVisibilityIcon)
                Positioned(
                  top: 5,
                  left: 16,
                  child: IconButton(
                    onPressed: () => showMasquer(context),
                    icon: const Icon(
                      Icons.visibility_off_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),

              // Plus d’options (icône Material)
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
    );
  }
}
