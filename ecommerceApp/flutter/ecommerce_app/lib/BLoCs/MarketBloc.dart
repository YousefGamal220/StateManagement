import 'package:ecommerce_app/Models/Market.dart';
import 'package:ecommerce_app/Resources/Repository.dart';
import 'package:rxdart/rxdart.dart';

class MarketBloc {
  final _repository = Repository();
  final _mobileFetcher = PublishSubject<Market>();

  Stream<Market> get allMobiles => _mobileFetcher.stream;

  fetchAllMobiles() async {
    Market market = await _repository.fetchAllMobiles();
    _mobileFetcher.sink.add(market);
  }

  dispose() {
    _mobileFetcher.close();
  }
}

final marketBloc = MarketBloc();
