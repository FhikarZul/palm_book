import 'dart:io';

import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:palm_book/core/styles/colors.dart';

class SearchField extends StatefulWidget {
  final String text;
  final bool enable;
  final Function(String) onChanged;

  const SearchField({
    super.key,
    required this.onChanged,
    required this.text,
    this.enable = true,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Platform.isAndroid ? 100 : 117,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            'assets/bg_search.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(color: kPrimaryMain.withAlpha(80)),
          Padding(
            padding: const EdgeInsets.only(bottom: 12, left: 14, right: 14),
            child: SearchBar(
              enabled: widget.enable,
              controller: controller,
              hintText: "What book are you looking for?",
              hintStyle: WidgetStatePropertyAll(
                TextStyle(fontWeight: FontWeight.w200, fontSize: 14),
              ),
              elevation: WidgetStatePropertyAll(0),
              constraints: BoxConstraints(minHeight: 45, maxHeight: 45),
              leading: HeroIcon(HeroIcons.magnifyingGlass, color: kNeutral70),
              trailing: [
                if (widget.text.isNotEmpty)
                  InkResponse(
                    onTap: () {
                      setState(() {
                        controller = TextEditingController(text: "");
                      });
                      widget.onChanged("");
                    },
                    child: HeroIcon(HeroIcons.xCircle, size: 20),
                  ),
              ],
              onChanged: widget.onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
