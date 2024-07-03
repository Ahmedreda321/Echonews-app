// ignore: camel_case_types
class category_model {
  final String image;
  final String typ;
  const category_model({required this.image, required this.typ});
}

// ignore: non_constant_identifier_names
List<category_model> category_list = [
  const category_model(
      image: 'assets/categories/general-.png', typ: 'politics'),
  const category_model(
      image: 'assets/categories/business.png', typ: 'Business'),
  const category_model(image: 'assets/categories/health-.png', typ: 'Health'),
  const category_model(image: 'assets/categories/science.png', typ: 'Science'),
  const category_model(image: 'assets/categories/sports-.png', typ: 'Sports'),
  const category_model(
      image: 'assets/categories/technology.png', typ: 'Technology'),
  const category_model(
      image: 'assets/categories/Entertaiment-.png', typ: 'Entertaiment'),
];
