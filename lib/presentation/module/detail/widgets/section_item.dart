import 'package:flutter/material.dart';
import 'package:palm_book/core/styles/colors.dart';

class SectionItem extends StatelessWidget {
  final List<Widget> children;
  final bool withDivider;

  const SectionItem({
    super.key,
    required this.children,
    this.withDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
        if (withDivider)
          Container(color: kNeutral30, height: 10, width: double.infinity),
      ],
    );
  }
}
