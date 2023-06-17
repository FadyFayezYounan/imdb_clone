import 'package:movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/usecase.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_cast_and_crew_entity/movie_cast_and_crew_entity.dart';
import 'package:movies_app/features/movie_details/domain/repositories/movie_details_repository.dart';

class GetMovieCastAndCrewUseCase extends UseCase<MovieCastAndCrewEntity, int> {
  final MovieDetailsRepository movieDetailsRepository;

  GetMovieCastAndCrewUseCase({required this.movieDetailsRepository});
  @override
  Future<Either<Failure, MovieCastAndCrewEntity>> call(int params) async {
    return await movieDetailsRepository.getMovieCastAndCrewById(id: params);
  }
}
