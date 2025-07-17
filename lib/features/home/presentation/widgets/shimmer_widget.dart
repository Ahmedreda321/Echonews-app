import 'package:flutter/material.dart';

// ignore: camel_case_types
class shrimmer_widget extends StatelessWidget {
  const shrimmer_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 20, bottom: 3, left: 3),
            height: 30,
            width: 390,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 50, left: 3, top: 5),
            height: 30,
            width: 390,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(
            height: 7,
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
                child: Container(
                  height: 200,
                  width: 365,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    //borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Container(
            margin: const EdgeInsets.only(left: 3, top: 5, bottom: 3, right: 5),
            height: 19,
            width: 390,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 3, top: 5, bottom: 5, right: 5),
            height: 19,
            width: 390,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 3, top: 3, bottom: 3, right: 5),
            height: 19,
            width: 390,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const Divider(
            indent: 10,
            endIndent: 10,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
