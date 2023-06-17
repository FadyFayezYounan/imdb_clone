import 'package:equatable/equatable.dart';

class BackdropEntity extends Equatable {
  const BackdropEntity({
    required this.aspectRatio,
    required this.filePath,
    required this.height,
    this.iso6391,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  final double aspectRatio;
  final String filePath;
  final int height;
  final String? iso6391;
  final double voteAverage;
  final int voteCount;
  final int width;

  @override
  List<Object?> get props => [
        aspectRatio,
        filePath,
        height,
        iso6391,
        voteAverage,
        voteCount,
        width,
      ];
}
