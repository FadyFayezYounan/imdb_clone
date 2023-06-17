//GenreEntity
import 'package:movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/usecase.dart';
import 'package:movies_app/features/movie_details/domain/repositories/movie_details_repository.dart';

import '../entities/movie_details_entity/genre_entity.dart';

class GetMovieKeywordsByIdUseCase extends UseCase<List<GenreEntity>, int> {
  final MovieDetailsRepository movieDetailsRepository;

  GetMovieKeywordsByIdUseCase({required this.movieDetailsRepository});
  @override
  Future<Either<Failure, List<GenreEntity>>> call(int params) async {
    return await movieDetailsRepository.getMovieKeywordsById(id: params);
  }
}
