import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_border_radius.dart';
import '../../../../core/utils/app_margin.dart';
import '../../../../core/utils/app_padding.dart';

class Category extends StatelessWidget {
  const Category(
      {super.key,
      required this.categoryName,
      this.onTap,
      this.isSelected = false});
  final String categoryName;
  final VoidCallback? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Container(
        margin: AppMargin.categoryMargin,
        padding: AppPadding.categoryPadding,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? AppColor.black : AppColor.grayColor,
          ),
          color: isSelected ? AppColor.primaryColor : AppColor.secondaryColor,
          borderRadius:
              BorderRadius.circular(AppBorderRadius.categoryBorderRadius),
        ),
        child: Text(
          categoryName,
          style: AppTextStyles.category,
        ),
      ),
    );
  }
}
