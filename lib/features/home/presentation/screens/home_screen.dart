import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/strings_constants.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../widgets/category_comp.dart';
import '../widgets/news_app_bar.dart';
import '../widgets/news_list_view.dart';
import '../widgets/on_home_error.dart';
import '../widgets/on_home_loading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().loadInitialNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NewsAppBar(),
      body: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current is HomeLoading ||
            current is HomeLoaded ||
            current is HomeError,
        builder: (context, state) {
          return Column(
            spacing: 10.h,
            children: [
              //  CATEGORIES
              SizedBox(
                height: 45.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: HomeCubit.categories.length,
                  itemBuilder: (context, index) {
                    final category = HomeCubit.categories[index];
                    return Category(
                      categoryName: category,
                      isSelected: HomeCubit.selectedCategory == category,
                      onTap: () {
                        state is HomeLoading
                            ? null
                            : context
                                .read<HomeCubit>()
                                .selectCategory(category);
                      },
                    );
                  },
                ),
              ),

              //  NEWS
              state.maybeWhen(
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
                error: (message) => OnHomeError(
                  message: message,
                  onRetry: () => context.read<HomeCubit>().loadInitialNews(),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}