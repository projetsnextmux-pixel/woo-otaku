import 'package:woo/core/constants/app_constants.dart';
import 'package:woo/core/services/api_client.dart';

class NotificationService {
  static Future<dynamic> getNotifications({int page = 1}) async {
    return await ApiClient.get('${AppConstants.notifications}?page=$page');
  }

  static Future<int> getUnreadCount() async {
    try {
      final res = await ApiClient.get(AppConstants.notifUnread);
      return res['unread_count'] ?? 0;
    } catch (_) {
      return 0;
    }
  }

  static Future<dynamic> markAllAsRead() async {
    return await ApiClient.put('${AppConstants.notifications}/read-all');
  }
}