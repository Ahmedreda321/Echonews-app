import 'package:news/features/home/data/models/base_response.dart';

import 'news_model.dart';

class NewsResponse extends BaseResponse {

  final int totalResults;
  final List<NewsModel> articles;

  NewsResponse({
    required super.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      status: json['status'] ?? '',
      totalResults: json['totalResults'] ?? 0,
      articles: json['articles'] != null
          ? (json['articles'] as List)
              .map((e) => NewsModel.fromjson(e))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'totalResults': totalResults,
        'articles': articles.map((e) => e.tojson()).toList(),
      };

      @override
  String toString() {
    return 'NewsResponse(status: $status, totalResults: $totalResults, articles: $articles)';
  }
}