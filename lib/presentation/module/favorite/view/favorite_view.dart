import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_book/core/styles/colors.dart';
import 'package:palm_book/core/styles/typography.dart';
import 'package:palm_book/presentation/module/favorite/controller/favorite_controller.dart';
import 'package:palm_book/presentation/module/favorite/widgets/liked_book_item.dart';
import 'package:palm_book/presentation/routes/app_route.dart';
import 'package:palm_book/presentation/widgets/empty_data_view.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 100,
          child: Stack(
            children: [
              Image.asset(
                'assets/bg_search.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(color: kPrimaryMain.withAlpha(80)),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 18,
                  ),
                  child: Text(
                    "Favorite Books",
                    style: kHeadline.copyWith(color: kNeutral90),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Obx(
            () => controller.books.isEmpty
                ? EmptyDataView()
                : ListView.builder(
                    padding: EdgeInsets.all(14),
                    itemCount: controller.books.length,
                    itemBuilder: (context, index) {
                      final item = controller.books[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: LikedBookItem(
                          item: item,
                          onPressed: () {
                            Get.toNamed(AppRoutes.detail, arguments: item.id);
                          },
                        ),
                      );
                    },
                  ),
          ),
        ),
      ],
    );
  }
}
