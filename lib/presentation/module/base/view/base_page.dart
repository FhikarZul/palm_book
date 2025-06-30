import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_book/core/styles/colors.dart';
import 'package:palm_book/presentation/module/base/constants/pages.dart';
import 'package:palm_book/presentation/module/base/widgets/bottom_navigation.dart';

import '../controller/base_controller.dart';

class BasePage extends GetView<BaseController> {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kNeutral10,
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => Column(
          children: [
            Flexible(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: pages.firstWhere(
                  (e) => e.key == Key(controller.selectedMenu.value.name),
                ),
              ),
            ),
            BottomNavigation(
              selectedMenu: controller.selectedMenu.value,
              onChanged: (menu) {
                controller.selectedMenu.value = menu;
              },
            ),
          ],
        ),
      ),
    );
  }
}
