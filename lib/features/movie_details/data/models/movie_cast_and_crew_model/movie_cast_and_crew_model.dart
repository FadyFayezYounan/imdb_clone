import 'package:movies_app/features/movie_details/data/models/movie_cast_and_crew_model/cast_model.dart';

import '../../../domain/entities/movie_cast_and_crew_entity/movie_cast_and_crew_entity.dart';

class MovieCastAndCrewModel extends MovieCastAndCrewEntity {
  const MovieCastAndCrewModel({
    required super.id,
    required super.cast,
    required super.crew,
  });
  factory MovieCastAndCrewModel.fromJson(Map<String, dynamic> json) =>
      MovieCastAndCrewModel(
        id: json["id"],
        cast: List<CastModel>.from(
            json["cast"].map((x) => CastModel.fromJson(x))),
        crew: List<CastModel>.from(
            json["crew"].map((x) => CastModel.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
  //       "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
  //     };
}
