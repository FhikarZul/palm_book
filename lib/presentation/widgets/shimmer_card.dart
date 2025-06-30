import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCard extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry borderRadius;
  final double width;
  final double height;

  const ShimmerCard({
    super.key,
    this.padding = const EdgeInsets.all(0),
    this.borderRadius = BorderRadius.zero,
    this.height = 100,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(width: width, height: height, color: Colors.white),
        ),
      ),
    );
  }
}
