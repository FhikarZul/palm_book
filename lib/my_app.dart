import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:palm_book/core/styles/colors.dart';
import 'package:palm_book/core/styles/typography.dart';
import 'package:palm_book/presentation/routes/app_pages.dart';
import 'package:palm_book/presentation/routes/app_route.dart';

class MyApp extends StatelessWidget {
  final String title;

  const MyApp({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: title,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        textTheme: kMobileTextTheme,
      ),
      initialRoute: AppRoutes.base,
      getPages: AppPages.pages,
    );
  }
}
