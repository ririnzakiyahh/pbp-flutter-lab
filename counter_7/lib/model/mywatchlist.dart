// To parse this JSON data, do
//
//     final myWatchList = myWatchListFromJson(jsonString);

import 'dart:convert';

List<MyWatchList> myWatchListFromJson(String str) => List<MyWatchList>.from(json.decode(str).map((x) => MyWatchList.fromJson(x)));

String myWatchListToJson(List<MyWatchList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyWatchList {
  MyWatchList({
    required this.model,
    required this.pk,
    required this.fields,
  });

  Model model;
  int pk;
  Fields fields;

  factory MyWatchList.fromJson(Map<String, dynamic> json) => MyWatchList(
    model: modelValues.map[json["model"]]!,
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": modelValues.reverse[model],
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  Fields({
    required this.watchedMovie,
    required this.movieTitle,
    required this.movieRate,
    required this.releaseDate,
    required this.movieReview,
  });

  String watchedMovie;
  String movieTitle;
  int movieRate;
  String releaseDate;
  String movieReview;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    watchedMovie: json["watched_movie"],
    movieTitle: json["movie_title"],
    movieRate: json["movie_rate"],
    releaseDate: json["release_date"],
    movieReview: json["movie_review"],
  );

  Map<String, dynamic> toJson() => {
    "watched_movie": watchedMovieValues.reverse[watchedMovie],
    "movie_title": movieTitle,
    "movie_rate": movieRate,
    "release_date": releaseDate,
    "movie_review": movieReview,
  };
}

enum WatchedMovie { SUDAH, BELUM }

final watchedMovieValues = EnumValues({
  "Belum": WatchedMovie.BELUM,
  "Sudah": WatchedMovie.SUDAH
});

enum Model { MYWATCHLIST_MYWATCHLISTITEM }

final modelValues = EnumValues({
  "mywatchlist.mywatchlistitem": Model.MYWATCHLIST_MYWATCHLISTITEM
});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
