import 'package:flutter/material.dart';
import 'package:palm_book/core/configs/flavor_config.dart';
import 'package:palm_book/core/configs/main_setup.dart';
import 'package:palm_book/core/constants/flavor_type.dart';
import 'package:palm_book/my_app.dart';

void main() async {
  FlavorConfig.create(
    appName: "Palm Book DEV",
    baseUrl: "https://gutendex.com",
    flavor: FlavorType.dev,
  );

  await MainSetup.create();

  runApp(MyApp(title: FlavorConfig.shared.appName));
}
