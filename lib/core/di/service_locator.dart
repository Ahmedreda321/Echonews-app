import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../features/home/data/datasources/news_local_data_source.dart';
import '../../features/home/data/datasources/news_remote_data_source.dart';
import '../../features/home/data/repositories/news_repo.dart';
import '../network/api_service.dart';
import '../network/dio_factory.dart';
import '../network/network_info.dart';
import '../utils/app_shared_preferences.dart';

final getIt = GetIt.instance;
setup() async {
  //AppPreferences
  final appPreferences = AppPreferences();
  await appPreferences.init();
  getIt.registerLazySingleton<AppPreferences>(() => appPreferences);
  //Dio instance
  Dio dio = DioFactory.getDio();
  // ApiService instance
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
// Register the InternetConnectionChecker
  getIt.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker.createInstance(),
  );
// Register network info
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfo(getIt()));
// Register home remote data source
  getIt.registerLazySingleton<NewsRemoteDataSource>(
      () => NewsRemoteDataSource(apiService: getIt()));

// Register home local data source
  getIt.registerLazySingleton<NewsLocalDataSource>(
      () => NewsLocalDataSource(getIt()));

// Register home repo
  getIt.registerLazySingleton<NewsRepo>(() => NewsRepo(
      newsRemoteDataSource: getIt(),
      newsLocalDataSource: getIt(),
      networkInfo: getIt()));
}
