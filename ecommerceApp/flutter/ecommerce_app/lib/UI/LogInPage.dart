import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
          child: Center(
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoTextField(
                autocorrect: true,
                controller: _userNameController,
                padding: EdgeInsets.all(4.0),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(4.0)),
              ),
              CupertinoTextField(
                autocorrect: true,
                controller: _passwordController,
                padding: EdgeInsets.all(4.0),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(4.0)),
              )
            ],
          ),
        ),
      )),
    );
  }
}
