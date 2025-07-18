import 'package:dio/dio.dart';
import 'package:news/core/network/api_service.dart';
import 'package:news/features/home/domain/models/news_model.dart';

import '../network/dio_factory.dart';

class NewsService {
final ApiService apiService = ApiService(DioFactory.getDio());
  Future<List<NewsModel>> getnews({required String query}) async {
    try {
      final dio = Dio();
      final response = await dio.get(
          'https://newsapi.org/v2/everything?q=$query&apiKey=21abb202ec754273942e8b5c6e555dc7');

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<NewsModel> newsList = [];

      for (var article in articles) {
        NewsModel newsModel = NewsModel.fromjson(article);
        newsList.add(newsModel);
      }
      return newsList;
    } on Exception catch (e) {
      print(e);
      return [];
    }
  }
}
