import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_size.dart';
import '../models/news.dart';
import 'news_list_view.dart';

class OnHomeLoading extends StatelessWidget {
  const OnHomeLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Skeletonizer(
        effect: const ShimmerEffect(
          baseColor: AppColor.grayColor,
          ),
        enabled: true,
        child: Padding(
          padding:  EdgeInsets.all(AppSize.small),
          child: NewsList(
            newslist: List.generate(
              6, 
              (index) => const News(
                description: 'This is a placeholder description for the news article that will be loaded soon.',
                title: 'Placeholder News Title Here zfkdsn\n jhdjsdjbkjdsbfkds',
                urlToImage: 'https://via.placeholder.com/400x200',
                url: 'https://example.com',
              ),
            ),
          ),
        ),
      ),
    );
  }
}