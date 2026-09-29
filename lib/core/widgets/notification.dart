import 'package:flutter/material.dart';

class NotificationService {
  static void showNotification(
    BuildContext context, 
    String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50,
        left: 90,
        right: 90,
        child: Material(
          color: Colors.transparent,
          child: Container( 
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 151, 156, 158),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        message,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    // Supprime automatiquement la notification après 3 secondes
    Future.delayed(const Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }
}

