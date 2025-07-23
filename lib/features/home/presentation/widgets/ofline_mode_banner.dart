import 'package:flutter/material.dart';

import '../../../../core/constants/strings_constants.dart';

class OfflineModeBanner extends StatelessWidget {
  final VoidCallback onRetry;
  const OfflineModeBanner({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        const Center(child: Text(AppStrings.offlineMode)),
        ElevatedButton(
          onPressed: () => onRetry,
          child: const Text(AppStrings.tryAgain),
        ),
        const Divider(),
      ],
    );
  }
}
