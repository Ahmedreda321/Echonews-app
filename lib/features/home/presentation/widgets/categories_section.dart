// widgets/categories_list_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_size.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'category_comp.dart';

class CategoriesListWidget extends StatelessWidget {
  const CategoriesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SizedBox(
          height: AppSize.categorySectionHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: HomeCubit.categories.length,
            itemBuilder: (context, index) {
              final category = HomeCubit.categories[index];
              return Category(
                categoryName: category,
                isSelected: HomeCubit.selectedCategory == category,
                onTap: () {
                  state is HomeLoading || state is HomeLoadedOffline
                      ? null
                      : context.read<HomeCubit>().selectCategory(category);
                },
              );
            },
          ),
        );
      },
    );
  }
}