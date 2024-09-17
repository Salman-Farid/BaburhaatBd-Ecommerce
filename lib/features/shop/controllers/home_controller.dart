import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();


  final carousalCurrentIndex = 0.obs;


  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }
}
