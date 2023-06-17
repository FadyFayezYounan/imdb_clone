import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

import 'package:movies_app/core/error/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:movies_app/features/search/data/datasources/search_local_data_source/search_local_data_source.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/search_local_repository.dart';

class SearchLocalRepositoryImpl implements SearchLocalRepository {
  final SearchLocalDataSource searchLocalDataSource;

  SearchLocalRepositoryImpl({required this.searchLocalDataSource});
  @override
  Future<Either<Failure, bool>> cacheSearchedMovie(
      {required List<MovieEntity> movieEntity}) async {
    try {
      final moviesModelsList = movieEntity
          .map((entity) => MovieModel(
                adult: entity.adult,
                backdropPath: entity.backdropPath,
                genreIds: entity.genreIds,
                id: entity.id,
                originalLanguage: entity.originalLanguage,
                originalTitle: entity.originalTitle,
                overview: entity.overview,
                popularity: entity.popularity,
                posterPath: entity.posterPath,
                releaseDate: entity.releaseDate,
                title: entity.title,
                video: entity.video,
                voteAverage: entity.voteAverage,
                voteCount: entity.voteCount,
              ))
          .toList();
      final status = await searchLocalDataSource.cacheSearchedMovie(
        movieModel: moviesModelsList,
      );
      return Right(status);
    } on CachedException catch (e) {
      return Left(CachedFailure(message: e.message.toString()));
    } catch (e) {
      return const Left(
        CachedFailure(
            message: 'something went wrong while caching user movies!'),
      );
    }
  }

  @override
  List<MovieEntity>? getCachedSearchedMovies() {
    return searchLocalDataSource.getCachedSearchedMovies();
  }

  @override
  Future<Either<Failure, bool>> deleteSearchHistory() async {
    try {
      final status = await searchLocalDataSource.deleteSearchHistory();
      return Right(status);
    } on CachedException catch (e) {
      return Left(CachedFailure(message: e.message.toString()));
    } catch (e) {
      return const Left(
        CachedFailure(
            message: 'something went wrong while caching user movies!'),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> deleteSearchMovie(
      {required MovieEntity movieEntity}) async {
    try {
      MovieModel cachedMovie = MovieModel(
        adult: movieEntity.adult,
        backdropPath: movieEntity.backdropPath,
        genreIds: movieEntity.genreIds,
        id: movieEntity.id,
        originalLanguage: movieEntity.originalLanguage,
        originalTitle: movieEntity.originalTitle,
        overview: movieEntity.overview,
        popularity: movieEntity.popularity,
        posterPath: movieEntity.posterPath,
        releaseDate: movieEntity.releaseDate,
        title: movieEntity.title,
        video: movieEntity.video,
        voteAverage: movieEntity.voteAverage,
        voteCount: movieEntity.voteCount,
      );
      final status = await searchLocalDataSource.deleteSearchMovie(
        movieModel: cachedMovie,
      );
      return Right(status);
    } on CachedException catch (e) {
      return Left(CachedFailure(message: e.message.toString()));
    } catch (e) {
      return const Left(
        CachedFailure(
            message: 'something went wrong while caching user movies!'),
      );
    }
  }
}
// import 'package:movies_app/features/home/data/models/movie_model.dart';
// import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

// import 'package:movies_app/core/error/failure.dart';

// import 'package:dartz/dartz.dart';
// import 'package:movies_app/features/search/data/datasources/search_local_data_source/search_local_data_source.dart';

// import '../../../../core/error/exceptions.dart';
// import '../../domain/repositories/search_local_repository.dart';

// class SearchLocalRepositoryImpl implements SearchLocalRepository {
//   final SearchLocalDataSource searchLocalDataSource;

//   SearchLocalRepositoryImpl({required this.searchLocalDataSource});
//   @override
//   Future<Either<Failure, bool>> cacheSearchedMovie(
//       {required MovieEntity movieEntity}) async {
//     try {
//       MovieModel cachedMovie = MovieModel(
//         adult: movieEntity.adult,
//         backdropPath: movieEntity.backdropPath,
//         genreIds: movieEntity.genreIds,
//         id: movieEntity.id,
//         originalLanguage: movieEntity.originalLanguage,
//         originalTitle: movieEntity.originalTitle,
//         overview: movieEntity.overview,
//         popularity: movieEntity.popularity,
//         posterPath: movieEntity.posterPath,
//         releaseDate: movieEntity.releaseDate,
//         title: movieEntity.title,
//         video: movieEntity.video,
//         voteAverage: movieEntity.voteAverage,
//         voteCount: movieEntity.voteCount,
//       );
//       final status = await searchLocalDataSource.cacheSearchedMovie(
//         movieModel: cachedMovie,
//       );
//       return Right(status);
//     } on CachedException catch (e) {
//       return Left(CachedFailure(message: e.message.toString()));
//     } catch (e) {
//       return const Left(
//         CachedFailure(
//             message: 'something went wrong while caching user movies!'),
//       );
//     }
//   }

//   @override
//   List<MovieEntity>? getCachedSearchedMovies() {
//     return searchLocalDataSource.getCachedSearchedMovies();
//   }

//   @override
//   Future<Either<Failure, bool>> deleteSearchHistory() async {
//     try {
//       final status = await searchLocalDataSource.deleteSearchHistory();
//       return Right(status);
//     } on CachedException catch (e) {
//       return Left(CachedFailure(message: e.message.toString()));
//     } catch (e) {
//       return const Left(
//         CachedFailure(
//             message: 'something went wrong while caching user movies!'),
//       );
//     }
//   }

//   @override
//   Future<Either<Failure, bool>> deleteSearchMovie(
//       {required MovieEntity movieEntity}) async {
//     try {
//       MovieModel cachedMovie = MovieModel(
//         adult: movieEntity.adult,
//         backdropPath: movieEntity.backdropPath,
//         genreIds: movieEntity.genreIds,
//         id: movieEntity.id,
//         originalLanguage: movieEntity.originalLanguage,
//         originalTitle: movieEntity.originalTitle,
//         overview: movieEntity.overview,
//         popularity: movieEntity.popularity,
//         posterPath: movieEntity.posterPath,
//         releaseDate: movieEntity.releaseDate,
//         title: movieEntity.title,
//         video: movieEntity.video,
//         voteAverage: movieEntity.voteAverage,
//         voteCount: movieEntity.voteCount,
//       );
//       final status = await searchLocalDataSource.deleteSearchMovie(
//         movieModel: cachedMovie,
//       );
//       return Right(status);
//     } on CachedException catch (e) {
//       return Left(CachedFailure(message: e.message.toString()));
//     } catch (e) {
//       return const Left(
//         CachedFailure(
//             message: 'something went wrong while caching user movies!'),
//       );
//     }
//   }
// }
