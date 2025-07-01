import 'package:flutter/material.dart';
import 'package:palm_book/core/styles/colors.dart';
import 'package:palm_book/core/styles/typography.dart';
import 'package:palm_book/domain/entities/liked_book_entity.dart';
import 'package:palm_book/presentation/widgets/cached_image.dart';

class LikedBookItem extends StatelessWidget {
  final Function() onPressed;
  final LikedBookEntity item;

  const LikedBookItem({super.key, required this.item, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    String? authorNames = item.authors.map((e) => e).join(' - ');

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: kNeutral40,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: InkWell(
        onTap: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachedImage(
              borderRadius: BorderRadius.circular(8),
              url: item.imageUrl,
              width: 70,
              height: 100,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: kBodyText.copyWith(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    SizedBox(height: 4),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: kPrimaryMain,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 8,
                        ),
                        child: Text(
                          authorNames,
                          style: kCaption2.copyWith(color: kNeutral10),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
