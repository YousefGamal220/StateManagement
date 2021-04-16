import 'package:ecommerce_app/Models/Specs.dart';

class Phone {
  String? model;
  String? brand;
  String? price;
  String? store;
  Specs? specs;
  String? imageUrl;
  int? stateBool;

  Phone.fromJson(Map<String, dynamic> jsonResp) {
    print("#### GETTING PHONE DATA ###");
    model = jsonResp.containsKey("model") ? jsonResp['model'] : null;
    brand = jsonResp.containsKey("brand") ? jsonResp['brand'] : null;
    price = jsonResp.containsKey("price") ? jsonResp['price'] : null;
    store = jsonResp.containsKey("store") ? jsonResp['store'] : null;
    specs = Specs.fromJson(jsonResp['specs']);
    imageUrl = jsonResp.containsKey("image") ? jsonResp['image'] : null;
    stateBool =
        jsonResp.containsKey("stateBool") ? jsonResp['stateBool'] : null;
  }
}
