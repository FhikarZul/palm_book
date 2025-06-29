import 'package:get/get.dart';
import 'package:palm_book/presentation/module/base/binding/base_binding.dart';
import 'package:palm_book/presentation/module/base/view/base_page.dart';
import 'package:palm_book/presentation/module/detail/view/detail_page.dart';
import 'package:palm_book/presentation/routes/app_route.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.base,
      page: () => const BasePage(),
      binding: BaseBinding(),
    ),
    GetPage(
      name: AppRoutes.detail,
      page: () => const DetailPage(),
      // binding: AuthBinding(),
    ),
  ];
}
