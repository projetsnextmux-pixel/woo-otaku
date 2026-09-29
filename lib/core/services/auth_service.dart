import 'package:woo/core/constants/app_constants.dart';
import 'package:woo/core/services/api_client.dart';
import 'package:woo/data/models/user.dart';

class AuthService {
  // Inscription WooVerse
  static Future<User> register({
    required String pseudo,
    required String password,
    required String passwordConfirmation,
    required int age,
    required String gender,
    required String country,
    required String question1,
    required String answer1,
    required String question2,
    required String answer2,
    required String question3,
    required String answer3,
    List<String> interests = const [],
  }) async {
    final res = await ApiClient.post(AppConstants.authRegister, body: {
      'pseudo': pseudo,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'age': age,
      'gender': gender,
      'country': country,
      'question_1': question1,
      'answer_1': answer1,
      'question_2': question2,
      'answer_2': answer2,
      'question_3': question3,
      'answer_3': answer3,
      'interests': interests,
    });

    final data = res['data'];
    final userJson = Map<String, dynamic>.from(data['user']);
    userJson['token'] = data['token'];

    final user = User.fromJson(userJson);
    await User.saveUser(user);
    return user;
  }

  // Connexion WooVerse (pseudo + password)
  static Future<User> login({
    required String pseudo,
    required String password,
    String deviceName = 'flutter_app',
  }) async {
    final res = await ApiClient.post(AppConstants.authLogin, body: {
      'pseudo': pseudo,
      'password': password,
      'device_name': deviceName,
    });

    final data = res['data'];
    final userJson = Map<String, dynamic>.from(data['user']);
    userJson['token'] = data['token'];

    final user = User.fromJson(userJson);
    await User.saveUser(user);
    return user;
  }

  // Profil connecté /auth/me
  static Future<User> getMe() async {
    final res = await ApiClient.get(AppConstants.authMe);
    final userJson = Map<String, dynamic>.from(res['data']);
    final user = User.fromJson(userJson);
    await User.saveUser(user);
    return user;
  }

  // Déconnexion
  static Future<void> logout() async {
    try {
      await ApiClient.post(AppConstants.authLogout);
    } catch (_) {}
    await User.clearUser();
  }
}