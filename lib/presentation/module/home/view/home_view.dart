import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_book/core/constants/menu_key.dart';
import 'package:palm_book/presentation/module/home/controller/home_controller.dart';
import 'package:palm_book/presentation/module/home/widgets/book_item.dart';
import 'package:palm_book/presentation/module/home/widgets/search_field.dart';
import 'package:palm_book/presentation/widgets/grid_lazy_load_wrapper.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          SearchField(
            text: controller.search.value,
            onChanged: (text) {
              controller.search.value = text;
            },
          ),
          controller.isLoading.value
              ? CircularProgressIndicator()
              : Expanded(
                  child: GridLazyLoadWrapper(
                    key: const PageStorageKey(MenuKey.home),
                    page: controller.page.value,
                    itemCount: controller.books.length,
                    childAspectRatio: 0.6,
                    padding: EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      final item = controller.books[index];
                      return BookItem(item: item);
                    },
                    isLoading: controller.isLoadingPaginate.value,
                    onChanged: (page) {
                      controller.page.value = page;
                      controller.getBooks(false);
                    },
                    onRefresh: () {
                      controller.getBooks(true);
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
