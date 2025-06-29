import 'package:flutter/material.dart';
import 'package:palm_book/presentation/module/base/constants/menu_key.dart';
import 'package:palm_book/presentation/module/favorite/view/favorite_view.dart';
import 'package:palm_book/presentation/module/home/view/home_view.dart';

List<Widget> pages = [
  HomeView(key: Key(MenuKey.home.name)),
  FavoriteView(key: Key(MenuKey.favorite.name)),
];
