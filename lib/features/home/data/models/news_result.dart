import '../../presentation/models/news.dart';

class NewsResult {
  final List<News> news;
  final bool isFromCache;

 const NewsResult({required this.news, required this.isFromCache});
}