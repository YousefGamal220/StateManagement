import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management/GetX/CounterState.dart';
import 'package:state_management/GetX/GetXWidget2.dart';

class GetXHome extends StatelessWidget {
  //final CounterState counterState = Get.put(CounterState());

  _showSnackBar() {
    Get.snackbar("GetX Demo", "Welcome to GetX Demo",
        snackPosition: SnackPosition.BOTTOM);
  }

  int numBuilds = 0;

  @override
  Widget build(BuildContext context) {
    print("You have build this widget ${numBuilds++} times");
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("GetX Demo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("You have pressed this counter many times:"),
              Obx(() => Text("${counterState.counter.value}"))
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => counterState.incrementCounter(),
              child: Icon(Icons.add),
            ),
            SizedBox(
              width: 4,
            ),
            FloatingActionButton(
              onPressed: () => _showSnackBar(),
              child: Icon(Icons.slideshow),
            ),
            SizedBox(
              width: 4,
            ),
            FloatingActionButton(
              onPressed: () => Get.to(GetXWidget2()),
              child: Icon(Icons.navigate_next),
            )
          ],
        ),
      ),
    );
  }
}
