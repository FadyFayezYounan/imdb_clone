import 'package:movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/usecase.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/home/domain/repositories/home_repository.dart';

class GetUpcomingMoviesUseCase extends UseCase<List<MovieEntity>, int> {
  final HomeRepository homeRepository;

  GetUpcomingMoviesUseCase({required this.homeRepository});
  @override
  Future<Either<Failure, List<MovieEntity>>> call(int params) async {
    return await homeRepository.getUpcomingMovies(page: params);
  }
}
