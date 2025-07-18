class NewsModel {
  final String? image;
  final String? title;
  final String? subtitle;
  final String? url;
  NewsModel(
      {required this.image,
      required this.title,
      required this.subtitle,
      required this.url});

  factory NewsModel.fromjson(json) {
    return NewsModel(
        image: json['urlToImage'],
        title: json['title'],
        subtitle: json['description'],
        url: json['url']);
  }
}
