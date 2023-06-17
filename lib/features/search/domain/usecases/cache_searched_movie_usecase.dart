import 'package:movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/usecase.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/search/domain/repositories/search_local_repository.dart';

class CacheSearchedMovieUseCase extends UseCase<bool, List<MovieEntity>> {
  final SearchLocalRepository searchLocalRepository;

  CacheSearchedMovieUseCase({required this.searchLocalRepository});
  @override
  Future<Either<Failure, bool>> call(List<MovieEntity> params) async {
    return searchLocalRepository.cacheSearchedMovie(movieEntity: params);
  }
}
// import 'package:movies_app/core/error/failure.dart';
// import 'package:dartz/dartz.dart';
// import 'package:movies_app/core/usecase/usecase.dart';
// import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
// import 'package:movies_app/features/search/domain/repositories/search_local_repository.dart';

// class CacheSearchedMovieUseCase extends UseCase<bool, MovieEntity> {
//   final SearchLocalRepository searchLocalRepository;

//   CacheSearchedMovieUseCase({required this.searchLocalRepository});
//   @override
//   Future<Either<Failure, bool>> call({required MovieEntity params}) async {
//     return searchLocalRepository.cacheSearchedMovie(movieEntity: params);
//   }
// }
