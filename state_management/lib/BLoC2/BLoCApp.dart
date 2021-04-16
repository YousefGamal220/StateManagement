import 'package:flutter/material.dart';
import 'package:state_management/BLoC2/src/UI/movie_list.dart';

class BlocApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MovieList(),
    );
  }
}
