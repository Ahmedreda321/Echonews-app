import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../features/home/data/models/news_response.dart';
import 'endpoint_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

// **************************************************************************
// News API
// **************************************************************************

  @GET(ApiConstants.everything)
  Future<NewsResponse> getNews(
    @Query('q') String query,
    @Query('apiKey') String apiKey,
  );
}
