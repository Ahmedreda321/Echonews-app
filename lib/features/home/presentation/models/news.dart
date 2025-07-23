class News {
  final String title;
  final String description;
  final String urlToImage;
  final String url;

 const News({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.url,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage'],
      url: json['url'],
    );
  }
  toJson() {
    return {
      'title': title,
      'description': description,
      'urlToImage': urlToImage,
      'url': url,
    };
  }
  @override
  String toString() {
    return 'News(title: $title, description: $description, urlToImage: $urlToImage, url: $url)';
  }
}