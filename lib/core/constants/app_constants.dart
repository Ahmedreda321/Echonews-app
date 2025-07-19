class AppConstants {
  AppConstants._();

  static const String appName = 'EchoNews';
  static const String fontFamily = 'crimson';
  static const String defaultImage =
      "https://media.wired.com/photos/5b17381815b2c744cb650b5f/master/w_2560%2Cc_limit/GettyImages-134367495.jpg";
  static const String cachedNewsKey = 'CACHED_NEWS';
  static const int maxCachedItems = 30;
  static const Duration cacheDuration = Duration(days: 1);
}
