import 'package:equatable/equatable.dart';

import 'backdrop_entity.dart';

class MovieImagesEntity extends Equatable {
  const MovieImagesEntity({
    required this.id,
    required this.backdrops,
    required this.posters,
  });

  final int id;
  final List<BackdropEntity> backdrops;
  final List<BackdropEntity> posters;

  @override
  List<Object?> get props => [
        id,
        backdrops,
        posters,
      ];
}
