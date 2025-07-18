
import 'package:dartz/dartz.dart';
import 'package:news/features/home/data/mapper/news_mapper.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../presentation/models/news.dart';
import '../datasources/news_remote_data_source.dart';

class NewsRepo {
  final NewsRemoteDataSource newsRemoteDataSource;
  final NetworkInfo networkInfo;
  NewsRepo (this.newsRemoteDataSource, this.networkInfo);

  Future <Either <Failure, List<News>>> getNews(String query) async {
    if (await networkInfo.isConnected) {
      try {
        final news = await newsRemoteDataSource.getNews(query);
        return Right(news.articles.toNewsList());
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
