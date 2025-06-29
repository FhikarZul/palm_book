import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_book/presentation/module/home/controller/home_controller.dart';
import 'package:palm_book/presentation/widgets/lazy_load_wrapper.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? CircularProgressIndicator()
          : ListLazyLoadWrapper(
              page: controller.page.value,
              itemCount: controller.books.length,
              itemBuilder: (context, index) {
                final item = controller.books[index];
                return Text(item.title);
              },
              isLoading: controller.isLoadingPaginate.value,
              onChanged: (page) {
                controller.page.value = page;
                controller.getBooks(false);
              },
              onRefresh: () {
                controller.getBooks(true);
              },
              onScrollPosition: (position) {
                print(position);
              },
            ),
    );
  }
}
