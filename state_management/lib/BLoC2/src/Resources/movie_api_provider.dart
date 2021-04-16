import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../Models/movieModel.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = '1910a7d9a94d074b3484be83b783482f';

  Future<MovieModel> fetchMovieList() async {
    print("entered");
    final response = await client.get(Uri.parse(
        "http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey"));
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return MovieModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
