import 'package:movies_app/features/movie_details/domain/entities/movie_images_entity/backdrop_entity.dart';

class BackdropModel extends BackdropEntity {
  const BackdropModel({
    required super.aspectRatio,
    required super.filePath,
    required super.height,
    required super.voteAverage,
    required super.voteCount,
    required super.width,
    super.iso6391,
  });
  factory BackdropModel.fromJson(Map<String, dynamic> json) => BackdropModel(
        aspectRatio: json["aspect_ratio"]?.toDouble(),
        filePath: json["file_path"],
        height: json["height"],
        iso6391: json["iso_639_1"],
        voteAverage: json["vote_average"],
        voteCount: json["vote_count"],
        width: json["width"],
      );
}
