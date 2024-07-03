import 'package:flutter/material.dart';
import 'package:news/widgets/category_comp.dart';
import 'package:news/models/category_model.dart';

class Catlistv extends StatelessWidget {
  const Catlistv({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50, // Adjust height as needed
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: category_list.length,
          itemBuilder: (context, i) {
            return category_comp(catmodel: category_list[i]);
          }),
    );
  }
}
