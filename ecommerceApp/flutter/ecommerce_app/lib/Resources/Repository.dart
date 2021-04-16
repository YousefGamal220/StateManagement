import 'package:ecommerce_app/Models/Market.dart';
import 'package:ecommerce_app/Resources/MobileApiProvider.dart';

class Repository {
  final MobileApiProvider mobileApiProvider = MobileApiProvider();
  Future<Market> fetchAllMobiles() => mobileApiProvider.fetchAllMobiles();
}
