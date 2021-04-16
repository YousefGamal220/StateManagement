import 'package:flutter/material.dart';
import 'package:state_management/BLoC/CounterEvent.dart';
import 'CounterBLoC.dart';

class BLoCHomePage extends StatefulWidget {
  @override
  _BLoCHomePageState createState() => _BLoCHomePageState();
}

class _BLoCHomePageState extends State<BLoCHomePage> {
  int numBuilds = 0;

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build is called ${numBuilds++} times");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("BLoC Demo"),
        ),
        body: Center(
            child: StreamBuilder(
          stream: bloc.counter,
          initialData: 0,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) =>
              Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("You have pushed this button many times:"),
              Text("${snapshot.data}")
            ],
          ),
        )),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => bloc.counterEventSink.add(IncrementEvent()),
              child: Icon(Icons.add),
            ),
            SizedBox(
              width: 4.0,
            ),
            FloatingActionButton(
              onPressed: () => bloc.counterEventSink.add(DecrementEvent()),
              child: Icon(Icons.remove),
            )
          ],
        ),
      ),
    );
  }
}
