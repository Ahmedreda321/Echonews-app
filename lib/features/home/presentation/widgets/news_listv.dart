// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import 'package:news/features/home/domain/models/news_model.dart';
import 'package:news/features/home/presentation/widgets/news_comp.dart';

class NewsListv extends StatelessWidget {
  List<NewsModel> newslist ;
  NewsListv({
    super.key,
    required this.newslist,
  });

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
