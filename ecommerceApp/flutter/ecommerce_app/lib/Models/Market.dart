import 'package:ecommerce_app/Models/Phone.dart';

class Market {
  int? numPhones;
  List<Phone> phones = [];

  Market.fromJson(Map<String, dynamic> jsonResp) {
    numPhones =
        jsonResp.containsKey("numPhones") ? jsonResp["numPhones"] : null;
    //phones = List<Phone>.from(jsonResp['phones']);
    var map = List<Map<String, dynamic>>.from(jsonResp['phones']);
    map.forEach((element) {
      Phone p = Phone.fromJson(element);
      phones.add(p);
    });
  }
}
