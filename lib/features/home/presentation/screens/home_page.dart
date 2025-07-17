import 'package:flutter/material.dart';
import 'package:news/features/home/presentation/widgets/catlistv.dart';
import 'package:news/features/home/presentation/widgets/news_list_view_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xffD1FFDD),
        appBar: AppBar(
          backgroundColor: const Color(0xffD1FFDD),
          scrolledUnderElevation: 0,
          centerTitle: true,
          title: Stack(children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(
                height: 18,
                width: 140,
                color: const Color(0xffF7E277),
              ),
            ),
            const Text(
              'EchoNews',
              style: TextStyle(
                  fontFamily: 'Abril',
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ]),
        ),
        body: const CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            SliverToBoxAdapter(
              child: Catlistv(),
            ),
            SliverToBoxAdapter(
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            NewsListViewBuilder(
              query: 'general',
            ),
          ],
        ),
      ),
    );
  }
}
