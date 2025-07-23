import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/news.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.initial() = _HomeInitial;
  const factory HomeState.loading() = HomeLoading;
  const factory HomeState.loaded({
    required List<News> news,
  }) = HomeLoaded;
  const factory HomeState.error({required String message}) = HomeError;
}
