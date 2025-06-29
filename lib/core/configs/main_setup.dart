import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:palm_book/core/configs/log.dart';
import 'package:palm_book/core/styles/colors.dart';
import 'package:palm_book/core/utils/http_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    final prefs = await SharedPreferences.getInstance();
    Get.put<SharedPreferences>(prefs, permanent: true);
    Get.put<HttpClient>(HttpClient(prefs), permanent: true);
  }
}
