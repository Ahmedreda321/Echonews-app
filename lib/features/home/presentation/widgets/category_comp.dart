import 'package:flutter/material.dart';
import 'package:news/features/home/domain/models/category_model.dart';
import 'package:news/features/home/presentation/screens/category_page.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return CategoryPage(categoryModel: categoryModel);
          }));
        },
        child: SizedBox(
          height: 50,
          child: Center(
            child: Text(
              categoryModel.type,
              style: const TextStyle(
                  fontFamily: 'crimson',
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
