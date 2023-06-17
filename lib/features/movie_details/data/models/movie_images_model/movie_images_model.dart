import 'package:movies_app/features/movie_details/data/models/movie_images_model/backdrop_model.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_images_entity/movie_images_entity.dart';

class MovieImagesModel extends MovieImagesEntity {
  const MovieImagesModel({
    required super.id,
    required super.backdrops,
    required super.posters,
  });
  factory MovieImagesModel.fromJson(Map<String, dynamic> json) =>
      MovieImagesModel(
        id: json["id"],
        backdrops: List<BackdropModel>.from(
            json["backdrops"].map((x) => BackdropModel.fromJson(x))),
        posters: List<BackdropModel>.from(
            json["posters"].map((x) => BackdropModel.fromJson(x))),
      );
}
