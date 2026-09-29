import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  final int id;
  final String pseudo;
  final int age;
  final String gender;
  final String country;
  final String rank;
  final int totalUe;
  final String? avatar;
  final String? bio;
  final String status;
  final List<dynamic> interests;
  final String? token;

  User({
    required this.id,
    required this.pseudo,
    required this.age,
    required this.gender,
    required this.country,
    required this.rank,
    required this.totalUe,
    this.avatar,
    this.bio,
    required this.status,
    required this.interests,
    this.token,
  });

  static User? sessionUser;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] is int ? json['id'] : int.tryParse('${json['id'] ?? 0}') ?? 0,
      pseudo: json['pseudo']?.toString() ?? json['username']?.toString() ?? '',
      age: json['age'] is int ? json['age'] : int.tryParse('${json['age'] ?? 18}') ?? 18,
      gender: json['gender']?.toString() ?? 'other',
      country: json['country']?.toString() ?? 'FR',
      rank: json['rank']?.toString() ?? 'F-',
      totalUe: json['total_ue'] is int ? json['total_ue'] : int.tryParse('${json['total_ue'] ?? 0}') ?? 0,
      avatar: json['avatar']?.toString(),
      bio: json['bio']?.toString(),
      status: json['status']?.toString() ?? 'active',
      interests: json['interests'] is List ? List.from(json['interests']) : [],
      token: json['token']?.toString() ?? json['access_token']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pseudo': pseudo,
      'age': age,
      'gender': gender,
      'country': country,
      'rank': rank,
      'total_ue': totalUe,
      'avatar': avatar,
      'bio': bio,
      'status': status,
      'interests': interests,
      'token': token,
    };
  }

  // Sauvegarder dans SharedPreferences
  static Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('session_user', jsonEncode(user.toJson()));
    if (user.token != null) {
      await prefs.setString('auth_token', user.token!);
    }
    sessionUser = user;
  }

  // Charger depuis SharedPreferences
  static Future<User?> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final String? userStr = prefs.getString('session_user');
    if (userStr != null) {
      try {
        final Map<String, dynamic> json = jsonDecode(userStr);
        final token = prefs.getString('auth_token');
        if (token != null) {
          json['token'] = token;
        }
        sessionUser = User.fromJson(json);
        return sessionUser;
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  // Supprimer la session
  static Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('session_user');
    await prefs.remove('auth_token');
    sessionUser = null;
  }
}