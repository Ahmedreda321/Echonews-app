import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';
import 'package:news/widgets/news_list_view_builder.dart';

// ignore: must_be_immutable
class CategoryPage extends StatelessWidget {
  CategoryPage({super.key, required this.catmodel});
  category_model catmodel;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            backgroundColor: const Color(0xffD1FFDD),
            centerTitle: true,
            title: Text(
              '${catmodel.typ} News',
              style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'crimson',
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: const Color(0xffD1FFDD),
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              const SliverToBoxAdapter(
                child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ),
              NewsListViewBuilder(query: catmodel.typ)
            ],
          )),
    );
  }
}
