import 'package:movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/usecase.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity/genre_entity.dart';
import 'package:movies_app/features/search/domain/repositories/search_remote_repository.dart';

class GetGenresUseCase extends UseCase<List<GenreEntity>, NoParams> {
  final SearchRemoteRepository searchRemoteRepository;

  GetGenresUseCase({required this.searchRemoteRepository});
  @override
  Future<Either<Failure, List<GenreEntity>>> call(NoParams params) async {
    return await searchRemoteRepository.getAllGenres();
  }
}
