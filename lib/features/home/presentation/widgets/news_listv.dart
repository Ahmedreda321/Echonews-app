import 'package:flutter/material.dart';
import 'package:news/features/home/presentation/widgets/news_comp.dart';
import 'package:news/models/news_model.dart';

// ignore: must_be_immutable
class NewsListv extends StatelessWidget {
  List<NewsModel> newslist = [];
  NewsListv({super.key, required this.newslist});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: newslist.length,
        (context, i) {
          return NewsComp(newsModel: newslist[i]);
        },
      ),
    );
  }
}
