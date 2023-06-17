import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/home/domain/usecases/get_latest_movies_usecase.dart';
import 'package:movies_app/features/home/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/features/home/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/features/home/domain/usecases/get_to_rated_movies_usecase.dart';
import 'package:movies_app/features/home/domain/usecases/get_upcoming_movies_usecase.dart';

import '../../../../core/error/failure.dart';

part 'home_state.dart';

typedef PaginationReturnType = Future<Either<Failure, List<MovieEntity>>>;

class HomeCubit extends Cubit<HomeState> {
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetUpcomingMoviesUseCase getUpcomingMoviesUseCase;
  final GetLatestMoviesUseCase getLatestMoviesUseCase;
  HomeCubit({
    required this.getPopularMoviesUsecase,
    required this.getTopRatedMoviesUsecase,
    required this.getNowPlayingMoviesUseCase,
    required this.getUpcomingMoviesUseCase,
    required this.getLatestMoviesUseCase,
  }) : super(HomeInitial());

  static HomeCubit of(BuildContext context, {bool listen = false}) =>
      BlocProvider.of<HomeCubit>(context, listen: listen);

  List<MovieEntity> _popularMovies = [];
  List<MovieEntity> get getPopularMovies => List.unmodifiable(_popularMovies);
  Future<void> _getPopularMoviesFunc({required int page}) async {
    //emit(GetPopularMoviesLoadingState());

    final result = await getPopularMoviesUsecase(page);
    result.fold(
      (failure) {
        //emit(GetPopularMoviesErrorState(errorMessage: failure.faiMessage));
        emit(GetHomeScreenMoviesErrorState(errorMessage: failure.faiMessage));
      },
      (moviesList) {
        _popularMovies = moviesList;
        //emit(GetPopularMoviesSuccessState());
      },
    );
  }

  PaginationReturnType getPopularMoviesPaginated(int page) {
    return getPopularMoviesUsecase(page);
  }

  List<MovieEntity> _topRatedMovies = [];
  List<MovieEntity> get getTopRatedMovies => List.unmodifiable(_topRatedMovies);
  Future<void> _getTopRatedMoviesFunc({required int page}) async {
    final result = await getTopRatedMoviesUsecase(page);
    result.fold(
      (failure) {
        emit(GetHomeScreenMoviesErrorState(errorMessage: failure.faiMessage));
      },
      (moviesList) {
        _topRatedMovies = moviesList;
      },
    );
  }

  PaginationReturnType getTopRatedMoviesPaginated(int page) async {
    return getTopRatedMoviesUsecase(page);
  }

  List<MovieEntity> _nowPlayingMovies = [];
  List<MovieEntity> get getNowPlayingMovies =>
      List.unmodifiable(_nowPlayingMovies);
  Future<void> _getNowPlayingMoviesFunc({required int page}) async {
    final result = await getNowPlayingMoviesUseCase(page);
    result.fold(
      (failure) {
        //emit(GetNowPlayingMoviesErrorState(errorMessage: failure.faiMessage));
        emit(GetHomeScreenMoviesErrorState(errorMessage: failure.faiMessage));
      },
      (moviesList) {
        //log('top rated ==> $moviesList');
        _nowPlayingMovies = moviesList;
      },
    );
  }

  PaginationReturnType getNowPlayingMoviesPaginated(int page) {
    return getNowPlayingMoviesUseCase(page);
  }

  List<MovieEntity> _upcomingMovies = [];
  List<MovieEntity> get getUpcomingMovies => List.unmodifiable(_upcomingMovies);
  Future<void> _getUpcomingMoviesFunc({required int page}) async {
    final result = await getUpcomingMoviesUseCase(page);
    result.fold(
      (failure) {
        //emit(GetUpcomingMoviesErrorState(errorMessage: failure.faiMessage));
        emit(GetHomeScreenMoviesErrorState(errorMessage: failure.faiMessage));
      },
      (moviesList) {
        _upcomingMovies = moviesList;
      },
    );
  }

  PaginationReturnType getUpcomingMoviesPaginated(int page) {
    return getUpcomingMoviesUseCase(page);
  }

  // List<MovieEntity> _latestMovies = [];
  // List<MovieEntity> get getLatestMovies => List.unmodifiable(_latestMovies);
  // Future<void> _getLatestMoviesFunc({required int page}) async {
  //   final result = await getLatestMoviesUseCase(page);
  //   result.fold(
  //     (failure) {
  //       emit(GetHomeScreenMoviesErrorState(errorMessage: failure.faiMessage));
  //     },
  //     (moviesList) {
  //       _latestMovies = moviesList;
  //     },
  //   );
  // }

  // PaginationReturnType getLatestMoviesPaginated(int page) {
  //   return getLatestMoviesUseCase(page);
  // }

  Future<void> getHomeScreenMovies() async {
    emit(GetHomeScreenMoviesLoadingState());
    await Future.wait([
      _getNowPlayingMoviesFunc(page: 1),
      _getPopularMoviesFunc(page: 1),
      _getTopRatedMoviesFunc(page: 1),
      _getUpcomingMoviesFunc(page: 1),
    ]);
    if (state is GetHomeScreenMoviesErrorState) return;
    emit(GetHomeScreenMoviesSuccessState());
  }
}
