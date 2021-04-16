import 'dart:convert';

import 'package:ecommerce_app/Models/Market.dart';
import 'package:ecommerce_app/Resources/Client.dart';

class MobileApiProvider {
  Future<Market> fetchAllMobiles() async {
    var response = await ServerClient.getRequest("getData/");
    if (response != -1) {
      return Market.fromJson(json.decode(response));
    } else {
      throw Exception("Failed to load");
    }
  }
}
