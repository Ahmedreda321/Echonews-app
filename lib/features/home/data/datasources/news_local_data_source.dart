
import 'package:news/features/home/data/mapper/news_mapper.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/app_shared_pref_consts.dart';
import '../../../../core/utils/app_shared_preferences.dart';
import '../../presentation/models/news.dart';
import '../models/news_model.dart';
import '../models/news_response.dart';

class NewsLocalDataSource {
  final AppPreferences appPreferences;

  NewsLocalDataSource(this.appPreferences);

  Future<void> cacheNews(NewsResponse newsResponse) async {
    final limitedArticles = newsResponse.articles
        .take(AppConstants.maxCachedItems)
        .map((e) => e.tojson())
        .toList();

    await appPreferences.setData(
      AppSharedPrefConsts.cachedNewsKey,
      limitedArticles,
    );
    
    await appPreferences.setData(
      AppSharedPrefConsts.cacheTimestampKey,
      DateTime.now().millisecondsSinceEpoch,
    );
  }

   Future<bool> isCacheValid() async {
    final lastUpdated = await appPreferences.getData(AppSharedPrefConsts.cacheTimestampKey);
    if (lastUpdated == null) return false;
    
    final cacheTime = DateTime.fromMillisecondsSinceEpoch(lastUpdated as int);
  return DateTime.now().difference(cacheTime) < AppConstants.cacheDuration;
  }


 
  Future<List<NewsModel>> _getCachedNewsModels() async {
    final cached = await appPreferences.getData(AppSharedPrefConsts.cachedNewsKey);
    if (cached == null) {
      throw const CacheException('No cached data');
    }

    return (cached as List<dynamic>)
        .map((e) => NewsModel.fromjson(e as Map<String, dynamic>))
        .toList();
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

      final cachedModels = await _getCachedNewsModels();
      return cachedModels.map((model) => model.toNews()).toList();
    } on CacheException {
      return [];
    }
  }

  Future<NewsResponse> getLastCachedNewsResponse() async {
    final models = await _getCachedNewsModels();
    return NewsResponse( status: "" , totalResults: 0 , articles: models);
  }


}