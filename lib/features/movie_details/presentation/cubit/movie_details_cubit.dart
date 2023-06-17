import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_cast_and_crew_entity/cast_entity.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity/genre_entity.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity/movie_details_entity.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_images_entity/backdrop_entity.dart';
import 'package:movies_app/features/movie_details/domain/usecases/get_movie_cast_and_crew_usecase.dart';
import 'package:movies_app/features/movie_details/domain/usecases/get_movie_details_by_id_usecase.dart';
import 'package:movies_app/features/movie_details/domain/usecases/get_movie_images_usecase.dart';
import 'package:movies_app/features/movie_details/domain/usecases/get_movie_keywords_by_id_usecase.dart';
import 'package:movies_app/features/movie_details/domain/usecases/get_movies_by_category_id_usecase.dart';
import 'package:movies_app/features/movie_details/domain/usecases/get_movies_by_keyword_id_usecase.dart';
import 'package:movies_app/features/movie_details/domain/usecases/get_recommended_movie_usecase.dart';
import 'package:movies_app/features/movie_details/domain/usecases/get_similar_movies_by_movie_id_usecase.dart';
import '../../../home/domain/entities/movie_entity.dart';
part 'movie_details_state.dart';

typedef PaginationReturnType = Future<Either<Failure, List<MovieEntity>>>;

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final GetMovieDetailsByIdUseCase getMovieDetailsByIdUseCase;
  final GetMovieCastAndCrewUseCase getMovieCastAndCrewUseCase;
  final GetSimilarMoviesByMovieIdUseCase getSimilarMoviesByMovieIdUseCase;
  final GetMovieImagesUseCase getMovieImagesUseCase;
  final GetRecommendedMoviesUseCase getRecommendedMoviesUseCase;
  final GetMoviesByCategoryIdUseCase getMoviesByCategoryIdUseCase;
  final GetMovieKeywordsByIdUseCase getMovieKeywordsByIdUseCase;
  final GetMoviesByKeywordIdUseCase getMoviesByKeywordIdUseCase;
  //final GetMovieVideosUseCase getMovieVideosUseCase;
  MovieDetailsCubit({
    required this.getMovieDetailsByIdUseCase,
    required this.getMovieCastAndCrewUseCase,
    required this.getSimilarMoviesByMovieIdUseCase,
    required this.getMovieImagesUseCase,
    required this.getRecommendedMoviesUseCase,
    required this.getMoviesByCategoryIdUseCase,
    required this.getMovieKeywordsByIdUseCase,
    required this.getMoviesByKeywordIdUseCase,
    // required this.getMovieVideosUseCase,
  }) : super(MovieDetailsInitial());

  static MovieDetailsCubit of(BuildContext context, {bool listen = false}) =>
      BlocProvider.of<MovieDetailsCubit>(context, listen: listen);

  MovieDetailsEntity? movieDetailsEntity;

  List<CastEntity> _movieCast = [];
  List<CastEntity> get getMovieCast => List.unmodifiable(_movieCast);
  List<CastEntity> _movieCrew = [];
  List<CastEntity> get getMovieCrew => List.unmodifiable(_movieCrew);

  Future<void> _getMovieCastAndCrewFunc({required int id}) async {
    final result = await getMovieCastAndCrewUseCase(id);
    result.fold(
      (failure) {
        emit(GetMovieCastAndCrewErrorState(errorMessage: failure.faiMessage));
      },
      (movieCastAndCrew) {
        _movieCast = movieCastAndCrew.cast;
        _movieCrew = movieCastAndCrew.crew;
      },
    );
  }

  List<BackdropEntity> _movieImages = [];
  List<BackdropEntity> get getMovieImages => List.unmodifiable(_movieImages);

  Future<void> _getMovieImagesFunc({
    required int id,
    required int page,
  }) async {
    final result =
        await getMovieImagesUseCase(GetMovieImagesParams(id: id, page: page));
    result.fold(
      (failure) {
        emit(GetMovieImagesErrorState(errorMessage: failure.faiMessage));
      },
      (images) {
        _movieImages = images.backdrops;
      },
    );
  }

  List<MovieEntity> _similarMoviesList = [];
  List<MovieEntity> get getSimilarMoviesList =>
      List.unmodifiable(_similarMoviesList);
  Future<void> _getSimilarMoviesFunc(
      {required int id, required int page}) async {
    final result =
        await getSimilarMoviesByMovieIdUseCase(GetSimilarMoviesByMovieIdParams(
      id: id,
      page: page,
    ));
    result.fold(
      (failure) {
        emit(GetSimilarMoviesErrorState(errorMessage: failure.faiMessage));
      },
      (similarMoviesList) {
        _similarMoviesList = similarMoviesList;
      },
    );
  }

  PaginationReturnType getSimilarMoviesPaginated(int id, int page) {
    return getSimilarMoviesByMovieIdUseCase(GetSimilarMoviesByMovieIdParams(
      id: id,
      page: page,
    ));
  }

  List<MovieEntity> _recommendedMoviesList = [];
  List<MovieEntity> get getRecommendedMoviesList =>
      List.unmodifiable(_recommendedMoviesList);
  Future<void> _getRecommendedMoviesFunc(
      {required int id, required int page}) async {
    final result = await getRecommendedMoviesUseCase(GetRecommendedMoviesParams(
      id: id,
      page: page,
    ));
    result.fold(
      (failure) {
        emit(GetRecommendedMoviesErrorState(errorMessage: failure.faiMessage));
      },
      (moviesList) {
        _recommendedMoviesList = moviesList;
      },
    );
  }

  PaginationReturnType getRecommendedMoviesPaginated(int id, int page) {
    return getRecommendedMoviesUseCase(GetRecommendedMoviesParams(
      id: id,
      page: page,
    ));
  }

  Future<void> getMovieDetailsByIdFunc({required int id}) async {
    emit(GetMovieDetailsLoadingState());
    final result = await getMovieDetailsByIdUseCase(id);
    await Future.wait([
      _getMovieCastAndCrewFunc(id: id),
      _getSimilarMoviesFunc(id: id, page: 1),
      _getMovieImagesFunc(id: id, page: 1),
      _getRecommendedMoviesFunc(id: id, page: 1),
      _getMovieKeywordsFunc(id: id),
    ]);
    result.fold(
      (failure) {
        emit(GetMovieDetailsErrorState(errorMessage: failure.faiMessage));
      },
      (movieDetails) {
        movieDetailsEntity = movieDetails;
        emit(GetMovieDetailsSuccessState());
      },
    );
  }

  PaginationReturnType getMoviesByCategoryIdPaginated(
    int categoryId,
    int page,
  ) {
    return getMoviesByCategoryIdUseCase(
      GetMoviesByCategoryIdParams(
        categoryId: categoryId,
        page: page,
      ),
    );
  }

  List<GenreEntity> _movieKeywordsList = [];
  List<GenreEntity> get movieKeywordsList =>
      List.unmodifiable(_movieKeywordsList);
  Future<void> _getMovieKeywordsFunc({required int id}) async {
    final result = await getMovieKeywordsByIdUseCase(id);
    result.fold(
      (failure) {
        emit(GetMovieCastAndCrewErrorState(errorMessage: failure.faiMessage));
      },
      (keywordsList) {
        _movieKeywordsList = keywordsList;
      },
    );
  }

  PaginationReturnType getMoviesByKeywordIdPaginated(
    int keywordId,
    int page,
  ) {
    return getMoviesByKeywordIdUseCase(
      GetMoviesByKeywordIdParams(
        id: keywordId,
        page: page,
      ),
    );
  }
}
