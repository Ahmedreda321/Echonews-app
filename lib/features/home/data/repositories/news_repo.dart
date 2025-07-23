import 'package:dartz/dartz.dart';
import 'package:news/features/home/data/mapper/news_mapper.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/error_handeler.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/news_local_data_source.dart';
import '../datasources/news_remote_data_source.dart';
import '../models/news_result.dart';

class NewsRepo {
  final NewsRemoteDataSource newsRemoteDataSource;
  final NewsLocalDataSource newsLocalDataSource;
  final NetworkInfo networkInfo;

  NewsRepo({
    required this.newsRemoteDataSource,
    required this.newsLocalDataSource,
    required this.networkInfo,
  });

  Future<Either<Failure, NewsResult>> getNews(String query) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteNews = await newsRemoteDataSource.getNews(query);
        final response = remoteNews.articles.toNewsList();
        await newsLocalDataSource.cacheNews(response);
        return Right(NewsResult(news: response, isFromCache: false));
      } catch (error) {
        return await _handleErrorOrGetCached(error);
      }
    } else {
      return await _getCachedNewsOrError();
    }
  }

  Future<Either<Failure, NewsResult>> _handleErrorOrGetCached(
      dynamic error) async {
    try {
      final cachedNews = await newsLocalDataSource.getCachedNews();
      if (cachedNews.isNotEmpty) {
        return Right(NewsResult(news: cachedNews, isFromCache: true));
      }
      return Left(ErrorHandler.handle(error).failure);
    } catch (e) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  Future<Either<Failure, NewsResult>> _getCachedNewsOrError() async {
    try {
      final cachedNews = await newsLocalDataSource.getCachedNews();
      if (cachedNews.isNotEmpty) {
        return Right(NewsResult(news: cachedNews, isFromCache: true));
      }
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    } catch (e) {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
