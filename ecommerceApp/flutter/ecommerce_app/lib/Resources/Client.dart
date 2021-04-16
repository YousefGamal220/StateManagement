import 'dart:convert';

import 'package:http/http.dart' show Client;

class ServerClient {
  static const serverURL = "https://evening-badlands-56619.herokuapp.com";
  static var serverClient = Client();

  static Future<dynamic> getRequest(String route) async {
    String finalRoute = serverURL + "/" + route;
    var response = await serverClient.get(Uri.parse(finalRoute));
    if (response.statusCode == 200) {
      var jsonString = response.body;

      return jsonString;
    } else {
      // return invalid State
      return -1; // Indicator for invalid status code
    }
  }

  static Future<dynamic> postRequest(
      String route, Map<String, dynamic> requestBody) async {
    String finalRoute = serverURL + "/" + route;
    var response = await serverClient.post(Uri.parse(finalRoute),
        headers: {'Content-type': 'application/json'},
        body: json.encode(requestBody));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      print("Success");
      return jsonString;
    } else
      return -1;
  }
}
