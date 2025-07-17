import 'package:flutter/material.dart';
import 'package:news/features/home/presentation/widgets/shimmer_widget.dart';
import 'package:shimmer/shimmer.dart';

class main_shimmer extends StatelessWidget {
  const main_shimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.transparent,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 20,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return const shrimmer_widget();
        },
      ),
    );
  }
}
