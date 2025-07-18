import 'package:flutter/material.dart';
import 'package:news/features/home/data/models/news_model.dart';
import 'package:news/core/services/news_service.dart';
import 'package:news/features/home/presentation/widgets/mian_shimmer.dart';
import 'package:news/features/home/presentation/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.query});
  final String query;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  late Future<List<NewsModel>> news;

  @override
  void initState() {
    super.initState();
    news = NewsService().getnews(query: widget.query);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsModel>>(
      future: news,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(newslist: snapshot.data!);
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Text(
              'oops there is no news now,\n try later',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'crimson',
              ),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: MainShimmer(),
          );
        }
      },
    );
  }
}