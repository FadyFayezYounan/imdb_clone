import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/usecase.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/movie_details/domain/repositories/movie_details_repository.dart';

class GetMoviesByCategoryIdUseCase
    extends UseCase<List<MovieEntity>, GetMoviesByCategoryIdParams> {
  final MovieDetailsRepository movieDetailsRepository;

  GetMoviesByCategoryIdUseCase({required this.movieDetailsRepository});
  @override
  Future<Either<Failure, List<MovieEntity>>> call(
      GetMoviesByCategoryIdParams params) async {
    return await movieDetailsRepository.getMoviesByCategoryId(
        getMoviesByCategoryIdParams: params);
  }
}

class GetMoviesByCategoryIdParams extends Equatable {
  final int categoryId;
  final int page;

  const GetMoviesByCategoryIdParams({
    required this.categoryId,
    required this.page,
  });

  @override
  List<Object?> get props => [
        categoryId,
        page,
      ];
}
