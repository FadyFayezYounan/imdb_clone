part of 'movie_videos_cubit.dart';

abstract class MovieVideosState extends Equatable {
  const MovieVideosState();

  @override
  List<Object> get props => [];
}

class MovieVideosInitial extends MovieVideosState {}

//* change user selected video states
class ChangeSelectedMovieVideoFrom extends MovieVideosState {}

class ChangeSelectedMovieVideoTo extends MovieVideosState {}

//? get movie videos list
class GetMovieVideosLoadingState extends MovieVideosState {}

class GetMovieVideosErrorState extends MovieVideosState {
  final dynamic errorMessage;

  const GetMovieVideosErrorState({required this.errorMessage});
}

class GetMovieVideosSuccessState extends MovieVideosState {}
