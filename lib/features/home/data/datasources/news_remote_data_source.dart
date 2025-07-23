import 'package:news/core/network/api_service.dart';

import '../models/news_response.dart';

class NewsRemoteDataSource {
  final ApiService apiService;
  NewsRemoteDataSource({required this.apiService});

  Future<NewsResponse> getNews(String query) async {
    return await apiService.getNews(query);
  }
}
