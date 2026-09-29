import 'package:woo/core/constants/app_constants.dart';
import 'package:woo/core/services/api_client.dart';

class FeedService {
  static Future<dynamic> getFeed({int page = 1}) async {
    return await ApiClient.get('${AppConstants.feed}?page=$page');
  }

  static Future<dynamic> getExploreFeed({int page = 1}) async {
    return await ApiClient.get('${AppConstants.feedExplore}?page=$page');
  }

  static Future<dynamic> createPost({required String content, String visibility = 'public'}) async {
    return await ApiClient.post(AppConstants.feedPosts, body: {
      'content': content,
      'visibility': visibility,
    });
  }

  static Future<dynamic> reactToPost(int postId, String emoji) async {
    return await ApiClient.post('${AppConstants.feedPosts}/$postId/react', body: {
      'emoji': emoji,
    });
  }

  static Future<dynamic> commentPost(int postId, String content) async {
    return await ApiClient.post('${AppConstants.feedPosts}/$postId/comments', body: {
      'content': content,
    });
  }

  static Future<dynamic> toggleBookmark(int postId) async {
    return await ApiClient.post('${AppConstants.feedPosts}/$postId/bookmark');
  }
}