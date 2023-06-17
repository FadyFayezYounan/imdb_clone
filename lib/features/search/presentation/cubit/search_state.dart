part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

//? search for movie states
class SearchMoviesLoadingState extends SearchState {}

class SearchMoviesErrorState extends SearchState {
  final dynamic errorMessage;

  const SearchMoviesErrorState({required this.errorMessage});
}

class SearchMoviesSuccessState extends SearchState {}

//* get all movies genres states
class GetAllMoviesGenresLoadingState extends SearchState {}

class GetAllMoviesGenresErrorState extends SearchState {
  final dynamic errorMessage;

  const GetAllMoviesGenresErrorState({required this.errorMessage});
}

class GetAllMoviesGenresSuccessState extends SearchState {}

//? clear search history state
class ClearSearchHistorySuccessState extends SearchState {}

//* delete search movie
class DeleteSearchMovieLoadingState extends SearchState {}

class DeleteSearchMovieSuccessState extends SearchState {}
