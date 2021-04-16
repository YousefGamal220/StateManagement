import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/Provider/MyProvider.dart';

class IncrementCounterWidget extends StatefulWidget {
  @override
  _IncrementCounterWidgetState createState() => _IncrementCounterWidgetState();
}

class _IncrementCounterWidgetState extends State<IncrementCounterWidget> {
  int buildCount = 0;
  @override
  Widget build(BuildContext context) {
    print("Inner build is called ${++buildCount}");
    var obj = Provider.of<MyProvider>(context);
    return Text("${obj.counter}", style: Theme.of(context).textTheme.headline4);
  }
}
