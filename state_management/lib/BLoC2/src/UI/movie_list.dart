import 'package:flutter/material.dart';
import 'package:state_management/BLoC/CounterBLoC.dart';
import '../Models/movieModel.dart';
import '../BLoCs/movies_bloc.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    movieBloc.fetchAllMovies();
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
      ),
      body: StreamBuilder(
        stream: movieBloc.allMovies,
        builder: (context, AsyncSnapshot<MovieModel> snapshot) =>
            movieWidget(context, snapshot),
      ),
    );
  }

  Widget buildList(AsyncSnapshot<MovieModel> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data!.results.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            'https://image.tmdb.org/t/p/w185${snapshot.data!.results[index].poster_path}',
            fit: BoxFit.cover,
          );
        });
  }

  Widget movieWidget(
          BuildContext context, AsyncSnapshot<MovieModel> snapshot) =>
      snapshot.hasData
          ? buildList(snapshot)
          : snapshot.hasError
              ? Text("Error")
              : Center(
                  child: CircularProgressIndicator(),
                );
}
