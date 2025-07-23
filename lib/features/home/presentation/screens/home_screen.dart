import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_size.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../widgets/categories_section.dart';
import '../widgets/news_app_bar.dart';
import '../widgets/news_section.dart';
import '../widgets/ofline_mode_banner.dart';

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
            current is HomeLoadedOffline ||
            current is HomeError,
        builder: (context, state) {
          return Column(
            spacing: AppSize.defaultSpacing,
            children: [
              // Categories Section
              const CategoriesListWidget(),
              
              // Offline Banner
              if (state is HomeLoadedOffline)
                const OfflineBannerWidget(),
              
              // News Content
              const NewsContentWidget(),
            ],
          );
        },
      ),
    );
  }
}
