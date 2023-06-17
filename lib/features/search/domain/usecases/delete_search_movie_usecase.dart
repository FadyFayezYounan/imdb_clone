import 'package:movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/usecase.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/search/domain/repositories/search_local_repository.dart';

class DeleteSearchMovieUseCase extends UseCase<bool, MovieEntity> {
  final SearchLocalRepository searchLocalRepository;

  DeleteSearchMovieUseCase({required this.searchLocalRepository});
  @override
  Future<Either<Failure, bool>> call(MovieEntity params) async {
    return await searchLocalRepository.deleteSearchMovie(movieEntity: params);
  }
}
