import 'package:flutter/material.dart';
import 'package:palm_book/core/styles/colors.dart';
import 'package:palm_book/core/styles/typography.dart';

class EmptyDataView extends StatelessWidget {
  const EmptyDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Center(child: Image.asset("assets/no_data.png", width: 100)),
        Text("No data found", style: kSubHeadline.copyWith(color: kNeutral80)),
      ],
    );
  }
}
