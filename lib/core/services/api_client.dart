import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:woo/core/constants/app_constants.dart';

class ApiClient {
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  static Future<Map<String, String>> getHeaders({bool isJson = true}) async {
    final token = await getToken();
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    if (isJson) {
      headers['Content-Type'] = 'application/json';
    }
    if (token != null && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  static Future<dynamic> get(String path) async {
    final uri = Uri.parse('${AppConstants.baseUrl}$path');
    final headers = await getHeaders();

    final response = await http.get(uri, headers: headers);
    return _processResponse(response);
  }

  static Future<dynamic> post(String path, {Map<String, dynamic>? body}) async {
    final uri = Uri.parse('${AppConstants.baseUrl}$path');
    final headers = await getHeaders();

    final response = await http.post(
      uri,
      headers: headers,
      body: body != null ? jsonEncode(body) : null,
    );
    return _processResponse(response);
  }

  static Future<dynamic> put(String path, {Map<String, dynamic>? body}) async {
    final uri = Uri.parse('${AppConstants.baseUrl}$path');
    final headers = await getHeaders();

    final response = await http.put(
      uri,
      headers: headers,
      body: body != null ? jsonEncode(body) : null,
    );
    return _processResponse(response);
  }

  static Future<dynamic> delete(String path) async {
    final uri = Uri.parse('${AppConstants.baseUrl}$path');
    final headers = await getHeaders();

    final response = await http.delete(uri, headers: headers);
    return _processResponse(response);
  }

  static dynamic _processResponse(http.Response response) {
    dynamic bodyJson;
    try {
      bodyJson = jsonDecode(response.body);
    } catch (_) {
      bodyJson = {'message': response.body};
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return bodyJson;
    }

    if (response.statusCode == 422) {
      final errors = bodyJson['errors'] ?? bodyJson['message'] ?? 'Erreur de validation';
      throw {'message': 'Erreur de validation', 'errors': errors, 'status': 422};
    }

    if (response.statusCode == 401) {
      throw {'message': 'Session expirée. Veuillez vous reconnecter.', 'status': 401};
    }

    final msg = bodyJson['message'] ?? 'Erreur serveur (${response.statusCode})';
    throw {'message': msg, 'status': response.statusCode};
  }
}