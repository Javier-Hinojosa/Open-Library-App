import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;

  const CustomShimmer({required this.height,this.width, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Shimmer.fromColors(
              baseColor: Colors.grey.shade400,
              highlightColor: Colors.grey.shade200,
              child: Container(
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  height: height,
                  width: MediaQuery.of(context).size.width,
                  child: const Card(elevation: 2))
            ),
    );
  }
}
