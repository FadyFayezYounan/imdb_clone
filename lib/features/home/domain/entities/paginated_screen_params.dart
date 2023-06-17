import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import 'movie_entity.dart';

typedef GetMoviesCallBack = Future<Either<Failure, List<MovieEntity>>> Function(
    int page);

class PaginatedScreenParams extends Equatable {
  final String screenTitle;
  final GetMoviesCallBack getMoviesFunc;

  const PaginatedScreenParams({
    required this.screenTitle,
    required this.getMoviesFunc,
  });

  @override
  List<Object?> get props => [
        screenTitle,
        getMoviesFunc,
      ];
}
