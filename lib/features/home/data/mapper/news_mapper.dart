import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/strings_constants.dart';
import '../../presentation/models/news.dart';
import '../models/news_model.dart';

extension NewsMapper on NewsModel {
  News toNews() {
    return News(
        title: title ?? AppStrings.empty,
        description: subtitle ?? AppStrings.empty,
        urlToImage: image ?? AppConstants.defaultImage,
        url: url ?? AppStrings.empty);
  }
}

extension NewsMapperList on List<NewsModel> {
  List<News> toNewsList() {
    return map((e) => e.toNews()).toList();
  }
}