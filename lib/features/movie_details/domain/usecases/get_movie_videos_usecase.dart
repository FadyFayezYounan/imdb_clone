import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/usecase.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_videos_entity/movie_video_entity.dart';
import 'package:movies_app/features/movie_details/domain/repositories/movie_details_repository.dart';

class GetMovieVideosUseCase extends UseCase<List<MovieVideoEntity>, int> {
  final MovieDetailsRepository movieDetailsRepository;

  GetMovieVideosUseCase({required this.movieDetailsRepository});
  @override
  Future<Either<Failure, List<MovieVideoEntity>>> call(int params) async {
    return await movieDetailsRepository.getMovieVideos(movieId: params);
  }
}
