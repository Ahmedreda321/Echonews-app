import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/strings_constants.dart';

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text(AppStrings.tryAgain),
          ),
        ],
      ),
    );
  }
}
