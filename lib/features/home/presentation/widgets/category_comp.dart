import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';
import 'package:news/features/home/presentation/screens/category_page.dart';

// ignore: camel_case_types
class category_comp extends StatelessWidget {
  const category_comp({super.key, required this.catmodel});
  final category_model catmodel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return CategoryPage(catmodel: catmodel);
          }));
        },
        child: SizedBox(
          height: 50,
          child: Center(
            child: Text(
              catmodel.typ,
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
