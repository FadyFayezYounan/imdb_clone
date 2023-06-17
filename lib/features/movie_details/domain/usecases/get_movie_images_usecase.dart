import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/usecase.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_images_entity/movie_images_entity.dart';
import 'package:movies_app/features/movie_details/domain/repositories/movie_details_repository.dart';

class GetMovieImagesUseCase
    extends UseCase<MovieImagesEntity, GetMovieImagesParams> {
  final MovieDetailsRepository movieDetailsRepository;

  GetMovieImagesUseCase({required this.movieDetailsRepository});
  @override
  Future<Either<Failure, MovieImagesEntity>> call(
    GetMovieImagesParams params,
  ) async {
    return await movieDetailsRepository.getMovieImages(
      getMovieImagesParams: params,
    );
  }
}

class GetMovieImagesParams extends Equatable {
  final int id;
  final int page;

  const GetMovieImagesParams({
    required this.id,
    required this.page,
  });

  @override
  List<Object?> get props => [
        id,
        page,
      ];
}
