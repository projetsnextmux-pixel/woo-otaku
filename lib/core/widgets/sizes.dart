import 'package:flutter/material.dart';

class AppTextSizes {
  // Tailles des textes
  static const double newsPublicationTime = 12; // Temps de publication des actualités
  static const double newsUsername = 14; // Pseudo en actualité
  static const double popupText = 11; // Texte de pop-up
  static const double commentPublicationTime = 10; // Temps de publication des commentaires
  static const double commentUsername = 12; // Pseudo en commentaires
  static const double commentText = 11; // Texte du commentaire
}

class AppTextStylesWithSizes {
  static const TextStyle newsPublicationTimeStyle = TextStyle(
    fontSize: AppTextSizes.newsPublicationTime,
  );

  static const TextStyle newsUsernameStyle = TextStyle(
    fontSize: AppTextSizes.newsUsername,
  );

  static const TextStyle popupTextStyle = TextStyle(
    fontSize: AppTextSizes.popupText,
  );

  static const TextStyle commentPublicationTimeStyle = TextStyle(
    fontSize: AppTextSizes.commentPublicationTime,
  );

  static const TextStyle commentUsernameStyle = TextStyle(
    fontSize: AppTextSizes.commentUsername,
  );

  static const TextStyle commentTextStyle = TextStyle(
    fontSize: AppTextSizes.commentText,
  );
}
