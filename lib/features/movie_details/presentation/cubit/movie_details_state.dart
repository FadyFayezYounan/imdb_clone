part of 'movie_details_cubit.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object> get props => [];
}

class MovieDetailsInitial extends MovieDetailsState {}

//? movie details states
class GetMovieDetailsLoadingState extends MovieDetailsState {}

class GetMovieDetailsErrorState extends MovieDetailsState {
  final dynamic errorMessage;

  const GetMovieDetailsErrorState({required this.errorMessage});
}

class GetMovieDetailsSuccessState extends MovieDetailsState {}

//* movie cast and crew states

class GetMovieCastAndCrewErrorState extends MovieDetailsState {
  final dynamic errorMessage;

  const GetMovieCastAndCrewErrorState({required this.errorMessage});
}
//? similar movies states

class GetSimilarMoviesErrorState extends MovieDetailsState {
  final dynamic errorMessage;

  const GetSimilarMoviesErrorState({required this.errorMessage});
}
//* similar movies states

class GetRecommendedMoviesErrorState extends MovieDetailsState {
  final dynamic errorMessage;

  const GetRecommendedMoviesErrorState({required this.errorMessage});
}

//? get movie images state

class GetMovieImagesErrorState extends MovieDetailsState {
  final dynamic errorMessage;

  const GetMovieImagesErrorState({required this.errorMessage});
}

//* get movies by category id states

class GetMoviesByCategoryIdErrorState extends MovieDetailsState {
  final dynamic errorMessage;

  const GetMoviesByCategoryIdErrorState({required this.errorMessage});
}

// //? get movie videos list
// class GetMovieVideosLoadingState extends MovieDetailsState {}

// class GetMovieVideosErrorState extends MovieDetailsState {
//   final dynamic errorMessage;

//   const GetMovieVideosErrorState({required this.errorMessage});
// }

// class GetMovieVideosSuccessState extends MovieDetailsState {}
