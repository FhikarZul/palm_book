import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:palm_book/core/styles/colors.dart';
import 'package:palm_book/presentation/widgets/shimmer_card.dart';

class CachedImage extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final BorderRadiusGeometry borderRadius;

  const CachedImage({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,

      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        height: height,
        width: width,
        placeholder: (context, url) => ShimmerCard(),
        errorWidget: (context, url, error) {
          return Container(
            height: height,
            width: width,
            color: kNeutral20,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: Icon(Icons.broken_image, color: kNeutral70)),
            ),
          );
        },
      ),
    );
  }
}
