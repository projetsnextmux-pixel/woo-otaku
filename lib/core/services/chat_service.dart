import 'package:woo/core/constants/app_constants.dart';
import 'package:woo/core/services/api_client.dart';

class ChatService {
  static Future<dynamic> getConversations({int page = 1}) async {
    return await ApiClient.get('${AppConstants.chatConvs}?page=$page');
  }

  static Future<dynamic> openDirectChat(String pseudo) async {
    return await ApiClient.post('${AppConstants.chatDirect}/$pseudo');
  }

  static Future<dynamic> getMessages(int conversationId, {int page = 1}) async {
    return await ApiClient.get('${AppConstants.chatConvs}/$conversationId/messages?page=$page');
  }

  static Future<dynamic> sendMessage(int conversationId, String content) async {
    return await ApiClient.post('${AppConstants.chatConvs}/$conversationId/messages', body: {
      'content': content,
    });
  }
}