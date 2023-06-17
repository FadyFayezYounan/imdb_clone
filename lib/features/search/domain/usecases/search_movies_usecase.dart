import 'package:movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/usecase.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/search/domain/repositories/search_remote_repository.dart';

class SearchMoviesUseCase extends UseCase<List<MovieEntity>, String?> {
  final SearchRemoteRepository searchRemoteRepository;

  SearchMoviesUseCase({required this.searchRemoteRepository});

  @override
  Future<Either<Failure, List<MovieEntity>>> call(String? params) async {
    return await searchRemoteRepository.searchMovies(query: params);
  }
}
// import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
// import 'package:movies_app/features/search/domain/repositories/search_repository.dart';

// class SearchMoviesUseCase {
//   final SearchRepository searchRepository;

//   SearchMoviesUseCase({required this.searchRepository});

//   Future<List<MovieEntity>> call({required String? query}) async {
//     return searchRepository.searchMovies(query: query);
//   }
// }
