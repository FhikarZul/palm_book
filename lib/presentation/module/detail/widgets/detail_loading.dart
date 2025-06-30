import 'package:flutter/material.dart';
import 'package:palm_book/presentation/module/detail/widgets/section_item.dart';
import 'package:palm_book/presentation/widgets/shimmer_card.dart';

class DetailLoading extends StatelessWidget {
  const DetailLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            ShimmerCard(width: double.infinity, height: 300),
            SectionItem(
              withDivider: false,
              children: [
                ShimmerCard(width: double.infinity, height: 14),
                SizedBox(height: 12),
                ShimmerCard(width: 200, height: 14),
                SizedBox(height: 12),
                ShimmerCard(width: 200, height: 14),
              ],
            ),
            SectionItem(
              withDivider: false,
              children: [
                ShimmerCard(width: double.infinity, height: 14),
                SizedBox(height: 12),
                ShimmerCard(width: 200, height: 14),
                SizedBox(height: 12),
                ShimmerCard(width: 200, height: 14),
              ],
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ShimmerCard(width: double.infinity, height: 50),
        ),
      ],
    );
  }
}
