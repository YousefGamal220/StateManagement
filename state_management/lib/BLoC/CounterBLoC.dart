import 'dart:async';

import 'package:state_management/BLoC/CounterEvent.dart';

class CounterBLoC {
  int _counter = 0;
  final _counterStateController = StreamController<int>();
  StreamSink<int> get _inCounter => _counterStateController.sink;
  Stream<int> get counter => _counterStateController.stream;

  final _counterEventController = StreamController<CounterEvent>();
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBLoC() {
    _counterEventController.stream.listen(_mapEventToState);
  }
  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent)
      _counter++;
    else
      _counter--;
    _inCounter.add(_counter);
  }

  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }
}

final bloc = CounterBLoC();
