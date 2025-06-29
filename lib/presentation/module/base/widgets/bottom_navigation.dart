import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:palm_book/core/styles/colors.dart';
import 'package:palm_book/core/styles/typography.dart';
import 'package:palm_book/core/constants/menu_key.dart';
import 'package:palm_book/presentation/module/base/constants/menus.dart';

class BottomNavigation extends StatelessWidget {
  final MenuKey selectedMenu;
  final Function(MenuKey) onChanged;

  const BottomNavigation({
    super.key,
    required this.selectedMenu,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(color: kNeutral30, thickness: 1, height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: menus
              .map(
                (e) => InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () {
                    onChanged(e.key);
                  },
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: e.key == selectedMenu
                              ? kPrimaryMain
                              : Colors.transparent,
                        ),
                        height: 3,
                        width: 60,
                      ),
                      SizedBox(height: 4),
                      HeroIcon(
                        style: HeroIconStyle.solid,
                        e.icon,
                        color: e.key == selectedMenu
                            ? kPrimaryMain
                            : kNeutral60,
                      ),
                      Text(
                        e.name,
                        style: kCaption1.copyWith(
                          fontWeight: e.key == selectedMenu
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
