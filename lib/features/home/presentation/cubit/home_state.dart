part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class GetPopularMoviesLoadingState extends HomeState {}

class GetPopularMoviesErrorState extends HomeState {
  final dynamic errorMessage;

  const GetPopularMoviesErrorState({required this.errorMessage});
}

class GetPopularMoviesSuccessState extends HomeState {}

//? get to rated movies states
class GetTopRatedMoviesLoadingState extends HomeState {}

class GetTopRatedMoviesErrorState extends HomeState {
  final dynamic errorMessage;

  const GetTopRatedMoviesErrorState({required this.errorMessage});
}

class GetTopRatedMoviesSuccessState extends HomeState {}

//* get now playing states

class GetNowPlayingMoviesErrorState extends HomeState {
  final dynamic errorMessage;

  const GetNowPlayingMoviesErrorState({required this.errorMessage});
}

//? get home screen movies

class GetHomeScreenMoviesLoadingState extends HomeState {}

class GetHomeScreenMoviesErrorState extends HomeState {
  final dynamic errorMessage;

  const GetHomeScreenMoviesErrorState({required this.errorMessage});
}

class GetHomeScreenMoviesSuccessState extends HomeState {}

//* get upcoming movies states

class GetUpcomingMoviesErrorState extends HomeState {
  final dynamic errorMessage;

  const GetUpcomingMoviesErrorState({required this.errorMessage});
}
