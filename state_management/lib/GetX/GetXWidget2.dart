import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:state_management/GetX/CounterState.dart';

class GetXWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Widget 2"),
      ),
      body: Center(
          child: Obx(
        () => Text("${counterState.counter.value}"),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterState.incrementCounter(),
        child: Icon(Icons.add),
      ),
    );
  }
}
