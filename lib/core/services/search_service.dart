import 'package:woo/core/constants/app_constants.dart';
import 'package:woo/core/services/api_client.dart';

class SearchService {
  static Future<dynamic> search(String query, {String type = 'all'}) async {
    return await ApiClient.get('${AppConstants.search}?q=$query&type=$type');
  }
}