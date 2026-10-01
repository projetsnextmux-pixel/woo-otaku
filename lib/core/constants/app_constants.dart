import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = "World Of Otaku";
  static const String appVersion = "1.0.0 (Bêta 2026)";

  // Base URL IP locale de l ordinateur pour acces depuis telephone Android physique sur le meme Wi-Fi
  static String get baseUrl {
    if (kIsWeb) {
      return "http://localhost:8000/api/v1";
    }
    // IP locale PC sur le Wi-Fi (permet au telephone physique Android de se connecter au backend local)
    return "http://192.168.84.12:8000/api/v1";
  }

  // Endpoints API v1
  static const String authRegister    = "/auth/register";
  static const String authLogin       = "/auth/login";
  static const String authLogout      = "/auth/logout";
  static const String authMe          = "/auth/me";

  static const String usersProfile   = "/users/profile";
  static const String usersAvatar    = "/users/avatar";
  
  static const String feed           = "/feed";
  static const String feedExplore    = "/feed/explore";
  static const String feedPosts      = "/feed/posts";
  static const String feedBookmarks  = "/feed/bookmarks";

  static const String woojutsuFeed   = "/woojutsu/feed";
  static const String woojutsuUpload = "/woojutsu";

  static const String chatConvs      = "/chat/conversations";
  static const String chatDirect     = "/chat/direct";
  static const String chatGroup      = "/chat/group";

  static const String notifications  = "/notifications";
  static const String notifUnread    = "/notifications/unread-count";

  static const String ranksMe        = "/ranks/me";
  static const String ranksAll       = "/ranks/all";
  static const String ueLeaderboard  = "/ue/leaderboard";
  static const String ueHistory      = "/ue/history";

  static const String classes        = "/classes";
  static const String quests         = "/quests";
  static const String clans          = "/clans";
  static const String guilds         = "/guilds";
  static const String woomingLives   = "/wooming/lives";
  static const String search         = "/search";

  // Thème WOO
  static const Color primaryColor   = Color(0xFFE50914);
  static const Color secondaryColor = Color(0xFF141414);
  static const Color accentColor    = Color(0xFFFFD700);
}