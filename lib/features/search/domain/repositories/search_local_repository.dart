import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../home/domain/entities/movie_entity.dart';

abstract class SearchLocalRepository {
  Future<Either<Failure, bool>> cacheSearchedMovie({
    required List<MovieEntity> movieEntity,
  });
  List<MovieEntity>? getCachedSearchedMovies();
  Future<Either<Failure, bool>> deleteSearchHistory();
  Future<Either<Failure, bool>> deleteSearchMovie({
    required MovieEntity movieEntity,
  });
}
// import 'package:dartz/dartz.dart';

// import '../../../../core/error/failure.dart';
// import '../../../home/domain/entities/movie_entity.dart';

// abstract class SearchLocalRepository {
//   Future<Either<Failure, bool>> cacheSearchedMovie({
//     required MovieEntity movieEntity,
//   });
//   List<MovieEntity>? getCachedSearchedMovies();
//   Future<Either<Failure, bool>> deleteSearchHistory();
//   Future<Either<Failure, bool>> deleteSearchMovie({
//     required MovieEntity movieEntity,
//   });
// }
