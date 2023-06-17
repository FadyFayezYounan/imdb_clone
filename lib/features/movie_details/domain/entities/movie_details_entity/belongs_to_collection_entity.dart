import 'package:equatable/equatable.dart';

class BelongsToCollectionEntity extends Equatable {
  const BelongsToCollectionEntity({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
  });

  final int id;
  final String name;
  final String? posterPath;
  final String? backdropPath;

  @override
  List<Object?> get props => [
        id,
        name,
        posterPath,
        backdropPath,
      ];
}
