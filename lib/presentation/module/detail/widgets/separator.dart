import 'package:flutter/material.dart';
import 'package:palm_book/core/styles/colors.dart';

class Separator extends StatelessWidget {
  const Separator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(color: kPrimaryMain, width: 100, height: 4),
      ),
    );
  }
}
