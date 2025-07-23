import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/di/service_locator.dart';
import 'package:news/features/home/presentation/cubit/home_cubit.dart';

import 'core/theme/app_theme.dart';
import 'core/utils/app_size.dart';
import 'features/home/presentation/screens/home_screen.dart';

class EchoNews extends StatelessWidget { 
  const EchoNews({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppSize.designSize,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
          home: BlocProvider(
            create: (context) => HomeCubit( getIt()),
            child: const HomeScreen(),
          ),
          theme: AppTheme.lightTheme,
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false),
    );
  }
}
