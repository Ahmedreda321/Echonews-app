import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/strings_constants.dart';
import '../../../../core/network/network_info.dart';
import '../../data/repositories/news_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final NetworkInfo networkInfo;
  final NewsRepo newsRepo;
  static const List<String> categories = [
    'technology',
    'business',
    'entertainment',
    'health',
    'science',
    'sports'
  ];

  static const String defaultCategory = 'general';

  HomeCubit(this.newsRepo, this.networkInfo) : super(const HomeState.initial());

  Future<void> loadInitialNews() async {
    await getNews(defaultCategory);
  }

  Future<void> getNews(String category) async {
    final isConnected = await networkInfo.isConnected;

    if (!isConnected) {
      final result = await newsRepo.getNews(category);
      result.fold(
        (failure) => emit(HomeState.error(message: failure.message)),
        (newsResult) {
          if (newsResult.isFromCache) {
            emit(HomeState.loadedOffline(news: newsResult.news));
          } else {
            emit(HomeState.loaded(news: newsResult.news));
          }
        },
      );
      return;
    }

    emit(const HomeState.loading());
    final result = await newsRepo.getNews(category);
    result.fold(
      (failure) => emit(HomeState.error(message: failure.message)),
      (newsResult) {
        if (newsResult.isFromCache) {
          emit(HomeState.loadedOffline(news: newsResult.news));
        } else {
          emit(HomeState.loaded(news: newsResult.news));
        }
      },
    );
  }

  static String? selectedCategory;

  void selectCategory(String category) async {
    final isConnected = await networkInfo.isConnected;

    if (!isConnected) {
      emit(const HomeState.error(
          message:AppStrings.noInternetError ));
      return;
    }

    if (selectedCategory == category) {
      selectedCategory = null;
      getNews(defaultCategory);
    } else {
      selectedCategory = category;
      getNews(category);
    }
  }
}
