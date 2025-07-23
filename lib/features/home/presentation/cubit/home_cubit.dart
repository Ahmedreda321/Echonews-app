import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/news_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
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

  HomeCubit(this.newsRepo) : super(const HomeState.initial());


  Future<void> loadInitialNews() async {
    await getNews(defaultCategory);
  }

  Future<void> getNews(String category) async {
    emit(const HomeState.loading());
    final result = await newsRepo.getNews(category);
    result.fold(
      (failure) => emit(HomeState.error(message: failure.message)),
      (news) => emit(HomeState.loaded(
        news: news,
      )),
    );
  }

   static String? selectedCategory;
  
  void selectCategory(String category) {
    if (selectedCategory == category) {
      selectedCategory = null;
      getNews(defaultCategory); 
    } else {
      selectedCategory = category;
      getNews(category);
    }
  }

}
