import 'package:heroicons/heroicons.dart';
import 'package:palm_book/core/constants/menu_key.dart';

List<MenuModel> menus = [
  MenuModel(key: MenuKey.home, name: "Home", icon: HeroIcons.home),
  MenuModel(key: MenuKey.favorite, name: "Favorite", icon: HeroIcons.heart),
];

class MenuModel {
  final MenuKey key;
  final String name;
  final HeroIcons icon;

  MenuModel({required this.key, required this.name, required this.icon});
}
