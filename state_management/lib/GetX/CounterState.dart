import 'package:get/get.dart';

class CounterState extends GetxController {
  RxInt counter = 0.obs;

  incrementCounter() => counter.value++;
}

final CounterState counterState = Get.put(CounterState());
