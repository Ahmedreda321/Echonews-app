import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/extensions/navigation_extensions.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/core/utils/app_size.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_padding.dart';
import '../models/news.dart';
import '../screens/web_view.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key, required this.news});
  final News news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.newsPadding,
      child: Column(
        spacing: AppSize.defaultSpacing,
        mainAxisSize: MainAxisSize.min,
        children: [
          // title
          NewsTitle(title: news.title, url: news.url),

          // image
          NewsImage(imageUrl: news.urlToImage),

          // description
          NewsDescription(description: news.description),
          const Divider(),
        ],
      ),
    );
  }
}

class NewsDescription extends StatelessWidget {
  const NewsDescription({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      maxLines: 3,
      style: AppTextStyles.newsDescription,
    );
  }
}

class NewsImage extends StatelessWidget {
  const NewsImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.newsImageHeight + 10.h,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: AppSize.imageTopPadding,
            left: AppSize.imageLeftPadding,
            child: Container(
              width: AppSize.newsImageWidth,
              height: AppSize.newsImageHeight,
              color: AppColor.grayColor,
            ),
          ),
          Positioned(
            bottom: AppSize.imageLeftPadding,
            right: AppSize.imageLeftPadding,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              colorBlendMode: BlendMode.modulate,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const ErrorImage(),
              height: AppSize.newsImageHeight,
              fit: BoxFit.cover,
              width: AppSize.newsImageWidth,
            ),
          ),
        ],
      ),
    );
  }
}

class NewsTitle extends StatelessWidget {
  const NewsTitle({
    super.key,
    required this.title,
    required this.url,
  });

  final String title, url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          context.push(
            Webviwe(
              title: title,
              url: url,
            ),
          );
        },
        child: Text(title, maxLines: 2, style: AppTextStyles.newsTitle));
  }
}

class ErrorImage extends StatelessWidget {
  const ErrorImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.defaultImage,
      height: AppSize.newsImageHeight,
      fit: BoxFit.cover,
      width: AppSize.newsImageWidth,
    );
  }
}
