import 'package:woo/core/constants/app_constants.dart';
import 'package:woo/core/services/api_client.dart';

class RankQuestService {
  static Future<dynamic> getMyRankProgress() async {
    return await ApiClient.get(AppConstants.ranksMe);
  }

  static Future<dynamic> getUeLeaderboard({int page = 1}) async {
    return await ApiClient.get('${AppConstants.ueLeaderboard}?page=$page');
  }

  static Future<dynamic> getQuests() async {
    return await ApiClient.get(AppConstants.quests);
  }

  static Future<dynamic> claimQuest(int questId) async {
    return await ApiClient.post('${AppConstants.quests}/$questId/claim');
  }
}