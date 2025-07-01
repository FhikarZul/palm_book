import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_book/core/styles/colors.dart';

void showSnackbar(String message) {
  Get.rawSnackbar(
    message: message,
    duration: Duration(seconds: 2),
    margin: EdgeInsets.all(16),
    borderRadius: 8,
    backgroundColor: kPrimaryMain,
    snackStyle: SnackStyle.FLOATING,
  );
}
