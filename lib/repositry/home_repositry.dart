import 'package:weather_app/Model/data_model.dart';
import 'package:weather_app/data/network/api_services.dart';
import 'package:weather_app/res/app_url/app_url.dart';

class HomeReposirty {
  static Future<dynamic> hitApi() async {
    var response = await ApiServices().getApi(AppUrl.url);
    return response;
  }
}
