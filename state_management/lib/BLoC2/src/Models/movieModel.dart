class MovieModel {
  int? _page;
  int? _total_results;
  int? _total_pages;
  List<_Result> _results = [];

  MovieModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['results'].length);
    _page = parsedJson['page'];
    _total_results = parsedJson['total_results'];
    _total_pages = parsedJson['total_pages'];
    List<_Result> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      _Result result = _Result(parsedJson['results'][i]);
      temp.add(result);
    }
    _results = temp;
  }

  List<_Result> get results => _results;

  int get total_pages => _total_pages ?? 0;

  int get total_results => _total_results ?? 0;

  int get page => _page ?? 0;
}

class _Result {
  int? _vote_count;
  int? _id;
  bool? _video;
  var _vote_average;
  String? _title;
  double? _popularity;
  String? _poster_path;
  String? _original_language;
  String? _original_title;
  List<int> _genre_ids = [];
  String? _backdrop_path;
  bool? _adult;
  String? _overview;
  String? _release_date;

  _Result(result) {
    _vote_count = result['vote_count'];
    _id = result['id'];
    _video = result['video'];
    _vote_average = result['vote_average'];
    _title = result['title'];
    _popularity = result['popularity'];
    _poster_path = result['poster_path'];
    _original_language = result['original_language'];
    _original_title = result['original_title'];
    for (int i = 0; i < result['genre_ids'].length; i++) {
      _genre_ids.add(result['genre_ids'][i]);
    }
    _backdrop_path = result['backdrop_path'];
    _adult = result['adult'];
    _overview = result['overview'];
    _release_date = result['release_date'];
  }

  String get release_date => _release_date ?? "Empty";

  String get overview => _overview ?? "Empty";

  bool get adult => _adult ?? false;

  String get backdrop_path => _backdrop_path ?? "Empty";

  List<int> get genre_ids => _genre_ids;

  String get original_title => _original_title ?? "Empty";

  String get original_language => _original_language ?? "Empty";

  String get poster_path => _poster_path ?? "Empty";

  double get popularity => _popularity ?? 0.0;

  String get title => _title ?? "Empty";

  double get vote_average => _vote_average ?? 0.0;

  bool get video => _video ?? false;

  int get id => _id ?? -1;

  int get vote_count => _vote_count ?? -1;
}
