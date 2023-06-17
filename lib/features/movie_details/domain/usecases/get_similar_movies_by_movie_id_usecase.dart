import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/usecase.dart';
import 'package:movies_app/features/movie_details/domain/repositories/movie_details_repository.dart';

import '../../../home/domain/entities/movie_entity.dart';

class GetSimilarMoviesByMovieIdUseCase
    extends UseCase<List<MovieEntity>, GetSimilarMoviesByMovieIdParams> {
  final MovieDetailsRepository movieDetailsRepository;

  GetSimilarMoviesByMovieIdUseCase({required this.movieDetailsRepository});
  @override
  Future<Either<Failure, List<MovieEntity>>> call(
      GetSimilarMoviesByMovieIdParams params) async {
    return await movieDetailsRepository.getSimilarMoviesByMovieId(
        getSimilarMoviesByMovieIdParams: params);
  }
}

class GetSimilarMoviesByMovieIdParams extends Equatable {
  final int id;
  final int page;

  const GetSimilarMoviesByMovieIdParams({
    required this.id,
    required this.page,
  });

  @override
  List<Object?> get props => [
        id,
        page,
      ];
}
// import 'package:equatable/equatable.dart';
// import 'package:movies_app/core/error/failure.dart';
// import 'package:dartz/dartz.dart';
// import 'package:movies_app/core/usecase/usecase.dart';
// import 'package:movies_app/features/movie_details/domain/entities/similar_movie_entity/similar_movie_entity.dart';
// import 'package:movies_app/features/movie_details/domain/repositories/movie_details_repository.dart';

// class GetSimilarMoviesByMovieIdUseCase
//     extends UseCase<List<SimilarMovieEntity>, GetSimilarMoviesByMovieIdParams> {
//   final MovieDetailsRepository movieDetailsRepository;

//   GetSimilarMoviesByMovieIdUseCase({required this.movieDetailsRepository});
//   @override
//   Future<Either<Failure, List<SimilarMovieEntity>>> call(
//       {required GetSimilarMoviesByMovieIdParams params}) async {
//     return await movieDetailsRepository.getSimilarMoviesByMovieId(
//         getSimilarMoviesByMovieIdParams: params);
//   }
// }

// class GetSimilarMoviesByMovieIdParams extends Equatable {
//   final int id;
//   final int page;

//   const GetSimilarMoviesByMovieIdParams({
//     required this.id,
//     required this.page,
//   });

//   @override
//   List<Object?> get props => [
//         id,
//         page,
//       ];
// }
