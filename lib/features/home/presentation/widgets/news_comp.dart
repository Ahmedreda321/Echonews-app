import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/features/home/data/models/news_model.dart';
import 'package:news/features/home/presentation/screens/web_view.dart';

class NewsComp extends StatefulWidget {
  const NewsComp({super.key, required this.newsModel});
  final NewsModel newsModel;

  @override
  State<NewsComp> createState() => _NewsCompState();
}

class _NewsCompState extends State<NewsComp> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Webviwe(
                            url: widget.newsModel.url ??
                                "https://www.edarabia.com/ar/5-%D9%85%D9%86-%D8%A3%D8%AC%D9%85%D9%84-%D8%B5%D9%84%D8%A7%D8%A9-%D8%B9%D9%84%D9%8A-%D8%A7%D9%84%D8%B1%D8%B3%D9%88%D9%84/",
                          )));
            },
            child: Text(
              widget.newsModel.title ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  height: 1,
                  fontFamily: 'bebas',
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 26),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 20),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.black,
                    ),
                  ),
                  height: 200,
                  width: 375,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.grey.withOpacity(1),
                    BlendMode.color,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: widget.newsModel.image ??
                        "https://media.wired.com/photos/5b17381815b2c744cb650b5f/master/w_2560%2Cc_limit/GettyImages-134367495.jpg",
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => Image.network(
                      "https://media.wired.com/photos/5b17381815b2c744cb650b5f/master/w_2560%2Cc_limit/GettyImages-134367495.jpg",
                      height: 200,
                      fit: BoxFit.cover,
                      width: 365,
                    ),
                    height: 200,
                    fit: BoxFit.cover,
                    width: 365,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            widget.newsModel.subtitle ?? "",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontFamily: 'crimson',
                fontSize: 19,
                color: Color.fromARGB(255, 114, 110, 110)),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
