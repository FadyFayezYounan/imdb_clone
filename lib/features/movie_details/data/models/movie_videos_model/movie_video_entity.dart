import '../../../domain/entities/movie_videos_entity/movie_video_entity.dart';

class MovieVideoModel extends MovieVideoEntity {
  const MovieVideoModel({
    required super.iso6391,
    required super.iso31661,
    required super.name,
    required super.key,
    required super.site,
    required super.size,
    required super.type,
    required super.official,
    required super.publishedAt,
    required super.id,
  });
  factory MovieVideoModel.fromJson(Map<String, dynamic> json) =>
      MovieVideoModel(
        iso6391: json["iso_639_1"],
        iso31661: json["iso_3166_1"],
        name: json["name"],
        key: json["key"],
        site: json["site"],
        size: json["size"],
        type: json["type"],
        official: json["official"],
        publishedAt: DateTime.parse(json["published_at"]),
        id: json["id"],
      );
}
