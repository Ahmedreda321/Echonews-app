import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/theme/app_theme.dart';
import 'core/utils/app_size.dart';
import 'features/home/presentation/screens/home_page.dart';

class EchoNews extends StatelessWidget {
  const EchoNews({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppSize.designSize,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
          home: const HomePage(),
          theme: AppTheme.lightTheme,
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false),
    );
  }
}
