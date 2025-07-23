class AppConstants {
  AppConstants._();

  static const String appName = 'EchoNews';
  static const String appBarFontFamily = 'Abril';
  static const String fontFamily = 'crimson';
  static const String newsTitleFontFamily = 'bebas';
  static const String defaultUrl =
      "https://media.istockphoto.com/id/1295689699/vector/print.jpg?s=1024x1024&w=is&k=20&c=0lmvuwVUYkDCdh_nqDuN9o3Rlvcp7jK6dB5OJtpbV7g=";
  static const String defaultImage =
      "https://media.wired.com/photos/5b17381815b2c744cb650b5f/master/w_2560%2Cc_limit/GettyImages-134367495.jpg";
  static const String cachedNewsKey = 'CACHED_NEWS';
  static const int maxCachedItems = 30;
  static const Duration cacheDuration = Duration(days: 1);
}
