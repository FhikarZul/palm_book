import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palm_book/core/configs/log.dart';
import 'package:palm_book/core/styles/colors.dart';

class MainSetup {
  static String baseUrl = "https://gutendex.com";

  static create() async {
    WidgetsFlutterBinding.ensureInitialized();

    Log.setup();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: kNeutral10,
        systemNavigationBarContrastEnforced: false,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
