import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/news_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final NewsRepo newsRepo;
  HomeCubit(this.newsRepo) : super(const HomeState.initial());

  Future<void> getNews(String query) async {
    emit(const HomeState.loading());
    final result = await newsRepo.getNews(query);
    result.fold(
      (failure) => emit(HomeState.error(message: failure.message)),
      (news) => emit(HomeState.loaded(news: news)),
    );
  }
}
