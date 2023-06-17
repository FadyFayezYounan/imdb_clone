import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/usecase.dart';
import 'package:movies_app/features/movie_details/domain/repositories/movie_details_repository.dart';

import '../../../home/domain/entities/movie_entity.dart';

class GetRecommendedMoviesUseCase
    extends UseCase<List<MovieEntity>, GetRecommendedMoviesParams> {
  final MovieDetailsRepository movieDetailsRepository;

  GetRecommendedMoviesUseCase({required this.movieDetailsRepository});
  @override
  Future<Either<Failure, List<MovieEntity>>> call(
      GetRecommendedMoviesParams params) async {
    return await movieDetailsRepository.getRecommendedMovies(
        getRecommendedMoviesParams: params);
  }
}

class GetRecommendedMoviesParams extends Equatable {
  final int id;
  final int page;

  const GetRecommendedMoviesParams({
    required this.id,
    required this.page,
  });

  @override
  List<Object?> get props => [
        id,
        page,
      ];
}
