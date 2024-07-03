import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news/models/news_model.dart';
import 'package:news/services/news_service.dart';
import 'package:news/widgets/mian_shimmer.dart';
import 'package:news/widgets/news_listv.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.query});
  final String query;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  late Future<List<NewsModel>> future;

  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getnews(query: widget.query);
    print('future: $future');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //  print('data: ${snapshot.data}');
          return NewsListv(newslist: snapshot.data!);
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
            child: main_shimmer(),
          );
        }
      },
    );
  }
}






// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:news/models/news_model.dart';
// import 'package:news/services/news_service.dart';
// import 'package:news/widgets/news_listv.dart';

// class NewsListViewBuilder extends StatefulWidget {
//   // ignore: non_constant_identifier_names
//   const NewsListViewBuilder({super.key, required this.category_name});
//   // ignore: non_constant_identifier_names
//   final String category_name;

//   @override
//   State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
// }

// class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
//   List<NewsModel> newslist = [];
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     getGeneralNews();
//   }

//   Future<void> getGeneralNews() async {
//     try {
//       newslist = await NewsService(Dio()).getnews(query: widget.category_name);
//     } catch (e) {
//       // Handle the error appropriately here
//       print('Error fetching news: $e');
//     } finally {
//       isLoading = false;
//       setState(() {});
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? const SliverToBoxAdapter(
//             child: Center(
//               child: CircularProgressIndicator(
//                 color: Colors.grey,
//               ),
//             ),
//           )
//         : newslist.isEmpty
//             ? const SliverToBoxAdapter(
//                 child: Text(
//                   'oops there is no news now,\n try later',
//                   style: TextStyle(
//                       // color: Colors.grey,
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: 'crimson'),
//                 ),
//               )
//             : NewsListv(newslist: newslist);
//   }
// }
