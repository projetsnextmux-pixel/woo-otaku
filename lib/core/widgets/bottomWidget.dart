import 'package:flutter/material.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:geolocator/geolocator.dart';


Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Service de localisation désactivé');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Permission de localisation refusée');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error('Permission de localisation refusée en permanence');
  }

  return await Geolocator.getCurrentPosition();
}

void sendLocation() async {
  Position position = await _determinePosition();
  print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
}

class BottomWidget extends StatefulWidget {
  final String name;
  final void Function(String message)? onSend;
  final int minLines;
  final int maxLines;
  final String? selectedMessage;
  final String? selectedAuthor;
  final VoidCallback? onClearSelectedMessage;
  final bool isSent; // Indicateur pour déterminer la couleur de fond

  const BottomWidget({
    super.key,
    required this.name,
    required this.onSend,
    required this.minLines,
    required this.maxLines,
    this.selectedMessage,
    this.selectedAuthor,
    this.onClearSelectedMessage,
    required this.isSent,
    required Icon iconWidget,
  });

  @override
  State<BottomWidget> createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget>
    with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  bool _isExpanded = false;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  OverlayEntry? _overlayEntry;


  IconData _currentSendIcon = Icons.send;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0), // Hors écran en bas
      end: Offset.zero, // À sa position normale
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }



  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      widget.onSend?.call(_controller.text); // Envoyer le message
      _controller.clear(); // Effacer le champ de texte
    }
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
      _currentSendIcon =
          _isExpanded
              ? Icons.attach_file
              : Icons.send; // Change l'icône principale

      if (_isExpanded) {
        _showOverlay();
        _animationController.forward();
      } else {
        _animationController.reverse();
        _hideOverlay();
      }
    });
  }



  void _showOverlay() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

// Remplace ta méthode _onSelectIcon par :
void _onSelectIcon(IconData icon, String action) {
  // 1) Exécute l’action choisie
  switch (icon) {
    case Icons.image:
      print("Choix image");
      break;
    case Icons.mic:
      print("Enregistrement vocal");
      break;
    case Icons.insert_emoticon:
      print("Emoji");
      break;
    case Icons.location_on:
      sendLocation();
      break;
  }
  // 2) Ferme immédiatement le menu secondaire
  _resetToSendIcon();
}

// Modifie _resetToSendIcon pour :
void _resetToSendIcon() {
  _animationController.reverse();   // si tu utilises une animation
  _hideOverlay();                   // supprime l’OverlayEntry
  setState(() {
    _currentSendIcon = Icons.send;  // remet l’icône en send
    _isExpanded = false;            // marque le menu comme fermé
  });
}


  OverlayEntry _createOverlayEntry() {

    return OverlayEntry(
      builder:
          (context) => Positioned(
            right: 10,
            bottom:
                60 +
                MediaQuery.of(context)
                    .viewInsets
                    .bottom, // Adapter la position en fonction du clavier
            child: SlideTransition(
              position: _slideAnimation,
              child: Material(
                color: Colors.transparent, // Fond transparent
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildIconButton(Icons.image, "Sélectionner une image"),
                    const SizedBox(height: 8),
                    _buildIconButton(Icons.mic, "Enregistrer une note vocale"),
                    const SizedBox(height: 8),
                    _buildIconButton(
                      Icons.insert_emoticon,
                      "Sélectionner un emoji",
                    ),
                    const SizedBox(height: 8),
                    _buildIconButton(
                      Icons.location_on,
                      "Envoyer la localisation",
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }

  Widget _buildIconButton(IconData icon, String action) {
    return GestureDetector(
      onTap: () => _onSelectIcon(icon, action),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border(top: BorderSide(color: Colors.grey.shade300)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.selectedMessage != null &&
                      widget.selectedAuthor != null)
                    _buildSelectedMessage(
                      widget.selectedMessage!,
                      widget.selectedAuthor!,
                      widget.isSent,
                    ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          minLines: widget.minLines,
                          maxLines: widget.maxLines,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.send,
                          onSubmitted: (value) => _sendMessage(),
                          decoration: InputDecoration(
                            hintText: "Tapez un message...",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                // Logique pour démarrer l'enregistrement vocal
                                print("Enregistrement vocal lancé");
                              },
                              child: Container(
                                padding: const EdgeInsets.all(
                                  6,
                                ), // Ajoute une marge en bas et en haut
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade600,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.mic,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          // Envoie le message directement lors d'un appui court
                          if (_currentSendIcon == Icons.send) {
                            _sendMessage();
                          }
                        },
                        onLongPress: () {
                          // Bascule vers l'icône d'attachement et affiche les options secondaires
                          if (_currentSendIcon == Icons.send) {
                            _toggleExpansion();
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color:
                                _currentSendIcon == Icons.attach_file
                                    ? Colors
                                        .grey
                                        .shade200 // Fond gris pour l'icône attach_file
                                    : Colors
                                        .transparent, // Pas de fond pour l'icône send
                            border:
                                _currentSendIcon == Icons.attach_file
                                    ? Border.all(
                                      color: Colors.grey.shade400,
                                    ) // Bordure grise pour attach_file
                                    : Border.all(
                                      color: Colors.transparent,
                                    ), // Pas de bordure pour l'icône send
                            shape:
                                BoxShape
                                    .circle, // Pour faire en sorte que l'icône soit ronde
                          ),
                          child: Icon(
                            _currentSendIcon == Icons.attach_file
                                ? Icons.attach_file
                                : Icons
                                    .send, // Change l'icône en fonction de l'état
                            color:
                                _currentSendIcon == Icons.attach_file
                                    ? Colors
                                        .grey
                                        .shade600 // Couleur grise pour attach_file
                                    : AppColors
                                        .primary, // Couleur bleue pour send
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSelectedMessage(
    String selectedMessage,
    String author,
    bool isSent,
  ) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(10),
        constraints: const BoxConstraints(maxWidth: 250),
        decoration: BoxDecoration(
          color: isSent ? AppColors.primary : Colors.grey[300],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    author,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isSent ? AppColors.white : Colors.black,
                    ),
                  ),
                  Text(
                    selectedMessage,
                    style: TextStyle(
                      color: isSent ? AppColors.white : Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close, color: Colors.red),
              onPressed: widget.onClearSelectedMessage,
            ),
          ],
        ),
      ),
    );
  }
}
