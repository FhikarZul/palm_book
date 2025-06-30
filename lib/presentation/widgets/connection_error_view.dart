import 'package:flutter/material.dart';
import 'package:palm_book/core/styles/colors.dart';
import 'package:palm_book/core/styles/typography.dart';

class ConnectionErrorView extends StatelessWidget {
  final Function() onPressed;
  final String message;

  const ConnectionErrorView({
    super.key,
    required this.onPressed,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Center(child: Image.asset("assets/no_connection.png", width: 100)),
        Text(message, style: kSubHeadline.copyWith(color: kNeutral80)),
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: onPressed,
          child: Text("Try again", style: kButtonText),
        ),
      ],
    );
  }
}
