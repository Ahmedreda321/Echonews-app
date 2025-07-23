import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/app_shared_pref_consts.dart';
import '../../../../core/utils/app_shared_preferences.dart';
import '../../presentation/models/news.dart';

class NewsLocalDataSource {
  final AppPreferences appPreferences;

  NewsLocalDataSource(this.appPreferences);

  Future<void> cacheNews(List<News> newsList) async {
    final limitedNews = newsList.take(AppConstants.maxCachedItems).toList();

    await appPreferences.saveModels(
      AppSharedPrefConsts.cachedNewsKey,
      limitedNews,
      (news) => news.toJson(),
    );

    await appPreferences.setData(
      AppSharedPrefConsts.cacheTimestampKey,
      DateTime.now().millisecondsSinceEpoch,
    );
  }

  Future<bool> isCacheValid() async {
    final lastUpdated =
        await appPreferences.getData(AppSharedPrefConsts.cacheTimestampKey);
    if (lastUpdated == null) return false;

    final cacheTime = DateTime.fromMillisecondsSinceEpoch(lastUpdated as int);
    return DateTime.now().difference(cacheTime) < AppConstants.cacheDuration;
  }

  Future<List<News>> _getCachedNewsObjects() async {
    // استخدم getModels بدلاً من getData
    final cachedNews = appPreferences.getModels(
      AppSharedPrefConsts.cachedNewsKey,
      (json) => News.fromJson(json),
    );
    
    if (cachedNews.isEmpty) {
      throw const CacheException('No cached data');
    }
    
    return cachedNews;
  }

  Future<void> clearCache() async {
    await appPreferences.removeData(AppSharedPrefConsts.cachedNewsKey);
    await appPreferences.removeData(AppSharedPrefConsts.cacheTimestampKey);
  }

  Future<List<News>> getCachedNews() async {
    try {
      if (!await isCacheValid()) {
        await clearCache();
        return [];
      }

      return await _getCachedNewsObjects();
    } on CacheException {
      return [];
    }
  }
}