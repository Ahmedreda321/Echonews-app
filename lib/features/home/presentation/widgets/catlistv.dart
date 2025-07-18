import 'package:flutter/material.dart';

import '../models/category_model.dart';
import 'category_comp.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50, 
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: categoryList.length,
          itemBuilder: (context, i) {
            return Category(categoryModel: categoryList[i]);
          }),
    );
  }
}
