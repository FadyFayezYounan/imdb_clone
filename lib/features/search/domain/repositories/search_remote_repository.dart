import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../../../movie_details/domain/entities/movie_details_entity/genre_entity.dart';

abstract class SearchRemoteRepository {
  Future<Either<Failure, List<MovieEntity>>> searchMovies({
    required String? query,
  });
  Future<Either<Failure, List<GenreEntity>>> getAllGenres();
}
