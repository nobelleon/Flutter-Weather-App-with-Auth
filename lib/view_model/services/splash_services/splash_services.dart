import 'dart:async';

import 'package:get/get.dart';
import 'package:weather_app/view/home/beranda.dart';
import 'package:weather_app/view_model/controllers/home_controller.dart';

class SplashServices {
  static void getApiData() {
    final controller = Get.put(HomeController());
    controller.getData();
  }
}
