import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' ;

import '../../../../core/constants/strings_constants.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'news_list_view.dart';
import 'on_home_error.dart';
import 'on_home_loading.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current is! HomeLoadedOffline,
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          initial: () => const SizedBox.shrink(),
          loading: () => const OnHomeLoading(),
          loaded: (news) {
            if (news.isEmpty) {
              return const Center(child: Text(AppStrings.noNews));
            }
            return Expanded(child: NewsList(newslist: news));
          },
          loadedOffline: (news) {
            if (news.isEmpty) {
              return const Center(child: Text(AppStrings.noNews));
            }
            return Expanded(child: NewsList(newslist: news));
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