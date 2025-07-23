import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_padding.dart';
import '../../../../core/utils/app_size.dart';

class NewsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NewsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Stack(children: [
        Padding(
          padding: AppPadding.appBarPadding,
          child: Container(
            height: AppSize.medium,
            width: AppSize.appBarContainerWidth,
            color: AppColor.secondaryColor,
          ),
        ),
        Text(AppConstants.appName, style: AppTextStyles.appBar),
      ]),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppSize.appBarHeight);
}
