import '../Resources/repository.dart';
import '../Models/movieModel.dart';

import 'package:rxdart/rxdart.dart';

class MovieBLoC {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<MovieModel>();

  Stream<MovieModel> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    MovieModel movieModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(movieModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final movieBloc = MovieBLoC();
