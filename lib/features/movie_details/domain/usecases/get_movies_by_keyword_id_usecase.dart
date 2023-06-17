import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/usecase.dart';
import 'package:movies_app/features/movie_details/domain/repositories/movie_details_repository.dart';

import '../../../home/domain/entities/movie_entity.dart';

class GetMoviesByKeywordIdUseCase
    extends UseCase<List<MovieEntity>, GetMoviesByKeywordIdParams> {
  final MovieDetailsRepository movieDetailsRepository;

  GetMoviesByKeywordIdUseCase({required this.movieDetailsRepository});
  @override
  Future<Either<Failure, List<MovieEntity>>> call(
      GetMoviesByKeywordIdParams params) async {
    return await movieDetailsRepository.getMoviesByKeywordId(
        getMoviesByKeywordIdParams: params);
  }
}

class GetMoviesByKeywordIdParams extends Equatable {
  final int id;
  final int page;

  const GetMoviesByKeywordIdParams({
    required this.id,
    required this.page,
  });

  @override
  List<Object?> get props => [
        id,
        page,
      ];
}
