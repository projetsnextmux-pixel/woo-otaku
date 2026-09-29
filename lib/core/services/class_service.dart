import 'package:woo/core/constants/app_constants.dart';
import 'package:woo/core/services/api_client.dart';

class ClassService {
  static Future<dynamic> getAllClasses() async {
    return await ApiClient.get(AppConstants.classes);
  }

  static Future<dynamic> selectClass(String slug) async {
    return await ApiClient.post('${AppConstants.classes}/select/$slug');
  }
}