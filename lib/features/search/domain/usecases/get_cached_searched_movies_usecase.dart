import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

import '../repositories/search_local_repository.dart';

class GetCachedSearchedMoviesUseCase {
  final SearchLocalRepository searchLocalRepository;

  GetCachedSearchedMoviesUseCase({required this.searchLocalRepository});
  List<MovieEntity>? call() {
    return searchLocalRepository.getCachedSearchedMovies();
  }
}
