import 'package:dartz/dartz.dart';
import 'package:news/core/network/error_handeler.dart';
import 'package:news/core/services/logger_service.dart';
import 'package:news/features/home/data/mapper/news_mapper.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../presentation/models/news.dart';
import '../datasources/news_local_data_source.dart';
import '../datasources/news_remote_data_source.dart';

class NewsRepo {
  final NewsRemoteDataSource newsRemoteDataSource;
  final NewsLocalDataSource newsLocalDataSource;
  final NetworkInfo networkInfo;

  NewsRepo({
    required this.newsRemoteDataSource,
    required this.newsLocalDataSource,
    required this.networkInfo,
  });

  Future<Either<Failure, List<News>>> getNews(String query) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteNews = await newsRemoteDataSource.getNews(query);
      //  await newsLocalDataSource.cacheNews(remoteNews);
        final response = remoteNews.articles.toNewsList();
        return Right(response);
      } catch (error, stackTrace) {
        AppLogger.e( 'Failed to fetch news: $error \n and stack trace: $stackTrace', stackTrace);
        return await _handleErrorOrGetCached(error);
      }
    } else {
      return await _getCachedNewsOrError();
    }
  }

  Future<Either<Failure, List<News>>> _handleErrorOrGetCached(
      dynamic error) async {
    try {
      final cachedNews = await newsLocalDataSource.getCachedNews();
      if (cachedNews.isNotEmpty) {
        return Right(cachedNews);
      }
      return Left(ErrorHandler.handle(error).failure);
    } catch (e) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  Future<Either<Failure, List<News>>> _getCachedNewsOrError() async {
    try {
      final cachedNews = await newsLocalDataSource.getCachedNews();
      if (cachedNews.isNotEmpty) {
        return Right(cachedNews);
      }
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    } catch (e) {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
