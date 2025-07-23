// widgets/offline_banner_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/strings_constants.dart';
import '../cubit/home_cubit.dart';

class OfflineBannerWidget extends StatelessWidget {
  const OfflineBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        const Center(
          child: Text(
            AppStrings.offlineMode,
          ),
        ),
        ElevatedButton(
          onPressed: () => context.read<HomeCubit>().loadInitialNews(),
          child: const Text(AppStrings.tryAgain),
        ),
        const Divider(),
      ],
    );
  }
}
