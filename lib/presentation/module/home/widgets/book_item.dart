import 'package:flutter/material.dart';
import 'package:palm_book/core/styles/colors.dart';
import 'package:palm_book/core/styles/typography.dart';
import 'package:palm_book/domain/entities/book_entity.dart';
import 'package:palm_book/presentation/widgets/cached_image.dart';
import 'package:palm_book/presentation/widgets/shimmer_card.dart';

class BookItem extends StatelessWidget {
  final BookEntity? item;
  final Function()? onPressed;

  const BookItem({super.key, this.item, this.onPressed});

  @override
  Widget build(BuildContext context) {
    String? authorNames = item?.authors.map((e) => e.name).join(' - ');

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
      height: 280,
      child: InkWell(
        onTap: onPressed,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Container(
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
                    child: CachedImage(
                      borderRadius: BorderRadius.circular(12),
                      url: item?.formats.imageJpeg,
                      height: 265,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: item == null ? 8 : 4,
                    horizontal: 8,
                  ),
                  child: item == null
                      ? ShimmerCard(height: 15, width: 100)
                      : Text(
                          item!.title,
                          style: kCaption1.copyWith(
                            color: kNeutral90,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(right: 12, top: 12),
                child: authorNames == null
                    ? ShimmerCard(
                        height: 16,
                        width: 100,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                          color: kPrimaryMain,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            authorNames,
                            style: kCaption2.copyWith(color: kNeutral10),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
