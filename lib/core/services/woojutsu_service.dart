import 'package:woo/core/constants/app_constants.dart';
import 'package:woo/core/services/api_client.dart';

class WooJutsuService {
  static Future<dynamic> getFeed({String type = 'for_you', int page = 1}) async {
    return await ApiClient.get('${AppConstants.woojutsuFeed}?type=$type&page=$page');
  }

  static Future<dynamic> toggleLike(int id) async {
    return await ApiClient.post('${AppConstants.woojutsuUpload}/$id/like');
  }

  static Future<dynamic> share(int id) async {
    return await ApiClient.post('${AppConstants.woojutsuUpload}/$id/share');
  }

  static Future<dynamic> comment(int id, String content) async {
    return await ApiClient.post('${AppConstants.woojutsuUpload}/$id/comments', body: {
      'content': content,
    });
  }
}