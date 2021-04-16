import 'dart:async';
import 'movie_api_provider.dart';
import '../Models/movieModel.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<MovieModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();
}
