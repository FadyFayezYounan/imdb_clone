import 'package:equatable/equatable.dart';
import 'cast_entity.dart';

class MovieCastAndCrewEntity extends Equatable {
  const MovieCastAndCrewEntity({
    required this.id,
    required this.cast,
    required this.crew,
  });

  final int id;
  final List<CastEntity> cast;
  final List<CastEntity> crew;

  @override
  List<Object?> get props => [
        id,
        cast,
        crew,
      ];
}
