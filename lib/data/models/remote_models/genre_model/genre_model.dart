import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre_model.freezed.dart';
part 'genre_model.g.dart';

@freezed
class GenreModel with _$GenreModel {
  factory GenreModel({
    int? id,
    String? name,
  }) = _GenreModel;

  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      _$GenreModelFromJson(json);
}
