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
        image: json['urlToImage'] as String?,
        title: json['title'] as String?,
        subtitle: json['description'] as String?,
        url: json['url'] as String?);
  }
  tojson() => {
        'urlToImage': image,
        'title': title,
        'description': subtitle,
        'url': url
      };

      @override
  String toString() {
    return 'NewsModel(image: $image, title: $title, subtitle: $subtitle, url: $url)';
  }
}
