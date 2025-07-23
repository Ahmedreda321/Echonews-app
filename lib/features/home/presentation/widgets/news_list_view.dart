import 'package:flutter/material.dart';

import '../models/news.dart';
import 'news_comp.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key, required this.newslist});
 final List<News> newslist;

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: newslist.length,
      itemBuilder: (context, index) {
        return NewsWidget(news: newslist[index]);
      },
    );
  }
}