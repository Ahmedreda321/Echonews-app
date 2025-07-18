import 'package:news/features/home/data/models/base_response.dart';

import 'news_model.dart';

class NewsResponse extends BaseResponse {
  final List<NewsModel> articles;

  NewsResponse({required this.articles});

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      articles: (json['articles'] as List)
          .map((e) => NewsModel.fromjson(e))
          .toList(),
    );
  }
} 