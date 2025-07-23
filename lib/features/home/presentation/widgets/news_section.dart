// widgets/news_content_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/strings_constants.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'news_list_view.dart';
import 'on_home_error.dart';
import 'on_home_loading.dart';

class NewsContentWidget extends StatelessWidget {
  const NewsContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          initial: () => const SizedBox.shrink(),
          loading: () => const OnHomeLoading(),
          loaded: (news) {
            if (news.isEmpty) {
              return const Center(
                child: Text(AppStrings.noNews),
              );
            }
            return Expanded(
              child: NewsList(newslist: news),
            );
          },
          loadedOffline: (news) {
            if (news.isEmpty) {
              return const Center(
                child: Text(AppStrings.noNews),
              );
            }
            return Expanded(
              child: NewsList(newslist: news),
            );
          },
          error: (message) => OnHomeError(
            message: message,
            onRetry: () => context.read<HomeCubit>().loadInitialNews(),
          ),
        );
      },
    );
  }
}