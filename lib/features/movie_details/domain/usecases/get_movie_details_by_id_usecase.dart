import 'package:movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/usecase.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity/movie_details_entity.dart';
import 'package:movies_app/features/movie_details/domain/repositories/movie_details_repository.dart';

class GetMovieDetailsByIdUseCase extends UseCase<MovieDetailsEntity, int> {
  final MovieDetailsRepository movieDetailsRepository;

  GetMovieDetailsByIdUseCase({required this.movieDetailsRepository});
  @override
  Future<Either<Failure, MovieDetailsEntity>> call(int params) async {
    return await movieDetailsRepository.getMovieDetailsById(id: params);
  }
}
