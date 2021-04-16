import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/BLoC/BLoCMain.dart';
import 'package:state_management/BLoC2/BLoCApp.dart';
import 'package:state_management/GetX/GetXHome.dart';
import 'package:state_management/Provider/IncrementCounterWidget.dart';
import 'package:state_management/Provider/MyProvider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (ctx) => MyProvider()),
      ChangeNotifierProvider(create: (ctx) => MyProvider2())
    ],
    child: BlocApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    var obj = Provider.of<MyProvider2>(context);
    return CupertinoApp(
      debugShowCheckedModeBanner: obj.showDebug,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  int buildCalled = 0;
  @override
  Widget build(BuildContext context) {
    print(++buildCalled);
    var obj = Provider.of<MyProvider>(context);
    var obj2 = Provider.of<MyProvider2>(context);
    var objFalseListen = Provider.of<MyProvider>(context, listen: false);
    var objFalseListen2 = Provider.of<MyProvider2>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("State Management"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("don't showDebug"),
                Switch(
                    value: obj2.showDebug,
                    onChanged: (val) => objFalseListen2.changeShowDebug(val)),
                const Text("showDebug")
              ],
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            IncrementCounterWidget()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          objFalseListen.increment();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
