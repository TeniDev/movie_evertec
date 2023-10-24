import 'package:movie_evertec/data/models/models.dart';

final genreListJson = {
  "genres": [
    {"id": 28, "name": "Action"},
    {"id": 12, "name": "Adventure"},
  ]
};

final genreListModel = [
  GenreModel.fromJson(
    {"id": 28, "name": "Action"},
  ),
  GenreModel.fromJson(
    {"id": 12, "name": "Adventure"},
  ),
];
