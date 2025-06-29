import 'package:get/get.dart';
import 'package:palm_book/core/constants/menu_key.dart';

class BaseController extends GetxController {
  Rx<MenuKey> selectedMenu = MenuKey.home.obs;
}
