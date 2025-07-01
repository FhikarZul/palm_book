import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:palm_book/core/configs/log.dart';
import 'package:palm_book/core/constants/hive_db.dart';
import 'package:palm_book/core/styles/colors.dart';
import 'package:palm_book/core/utils/http_client.dart';
import 'package:palm_book/data/model/dao/liked_book_dao.dart';
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

    await Hive.initFlutter();
    Hive.registerAdapter(LikedBookDaoAdapter());
    await Hive.openBox<LikedBookDao>(hiveDbName);

    final box = Hive.box<LikedBookDao>(hiveDbName);
    Get.lazyPut<Box<LikedBookDao>>(() => box, fenix: true);

    final prefs = await SharedPreferences.getInstance();
    Get.lazyPut<SharedPreferences>(() => prefs, fenix: true);
    Get.lazyPut<HttpClient>(() => HttpClient(prefs), fenix: true);
  }
}
