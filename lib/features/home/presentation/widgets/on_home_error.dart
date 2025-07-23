import 'package:flutter/material.dart';

import '../../../../core/constants/strings_constants.dart';
import '../../../../core/utils/app_size.dart';

class OnHomeError extends StatelessWidget {
  const OnHomeError({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        spacing: AppSize.defaultSpacing,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
         
          ElevatedButton(
            onPressed: onRetry,
            child: const Text(AppStrings.tryAgain),
          ),
        ],
      ),
    );
  }
}
