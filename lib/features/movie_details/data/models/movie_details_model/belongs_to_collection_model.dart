import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity/belongs_to_collection_entity.dart';

class BelongsToCollectionModel extends BelongsToCollectionEntity {
  const BelongsToCollectionModel({
    required super.id,
    required super.name,
    required super.posterPath,
    required super.backdropPath,
  });

  factory BelongsToCollectionModel.fromJson(Map<String, dynamic> json) =>
      BelongsToCollectionModel(
        id: json["id"],
        name: json["name"],
        posterPath: json["poster_path"],
        backdropPath: json["backdrop_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "poster_path": posterPath,
        "backdrop_path": backdropPath,
      };
}
