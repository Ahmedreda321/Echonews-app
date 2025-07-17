import 'package:dio/dio.dart';
import 'package:news/models/news_model.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);

  Future<List<NewsModel>> getnews({required String query}) async {
    try {
      final dio = Dio();
      final response = await dio.get(
          'https://newsapi.org/v2/everything?q=$query&apiKey=21abb202ec754273942e8b5c6e555dc7');

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      // ignore: non_constant_identifier_names
      List<NewsModel> NewsList = [];

      for (var article in articles) {
        NewsModel newsModel = NewsModel.fromjson(article);
        NewsList.add(newsModel);
      }
      return NewsList;
    } on Exception catch (e) {
      print(e);
      return [];
    }
  }
}
