import 'package:movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/usecase.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/home/domain/repositories/home_repository.dart';

class GetTopRatedMoviesUsecase extends UseCase<List<MovieEntity>, int> {
  final HomeRepository homeRepository;

  GetTopRatedMoviesUsecase({required this.homeRepository});

  @override
  Future<Either<Failure, List<MovieEntity>>> call(int params) async {
    return await homeRepository.getTopRatedMovies(page: params);
  }
}
