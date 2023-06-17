import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/movie_videos_entity/movie_video_entity.dart';
import '../../../domain/usecases/get_movie_videos_usecase.dart';

part 'movie_videos_state.dart';

class MovieVideosCubit extends Cubit<MovieVideosState> {
  final GetMovieVideosUseCase getMovieVideosUseCase;
  MovieVideosCubit({
    required this.getMovieVideosUseCase,
  }) : super(MovieVideosInitial());

  List<MovieVideoEntity> _movieVideosList = [];
  List<MovieVideoEntity> get movieVideosList =>
      List.unmodifiable(_movieVideosList.reversed.toList());
  List<MovieVideoEntity> get movieVideosListWithoutFirstVideo {
    final newList = _movieVideosList.sublist(0, _movieVideosList.length - 1);
    return List.unmodifiable(newList.reversed.toList());
  }

  MovieVideoEntity? _selectedMovieVideo;
  MovieVideoEntity? get selectedMovieVideo => _selectedMovieVideo;

  set setSelectedMovieVideo(MovieVideoEntity newVideo) {
    if (_selectedMovieVideo != newVideo) {
      emit(ChangeSelectedMovieVideoFrom());
      _selectedMovieVideo = newVideo;
      emit(ChangeSelectedMovieVideoTo());
    }
  }

  bool isSameVideo(MovieVideoEntity currentVideo) {
    if (_selectedMovieVideo == currentVideo) {
      return true;
    }
    return false;
  }

  int _currentMovieId = 0;
  Future<void> getMovieVideosFunc({required int id}) async {
    // check if the user in the same movie and already get the movie videos
    // don't load them again, if the user change the movie load the new movie videos.
    if (_movieVideosList.isNotEmpty && _currentMovieId == id) return;
    emit(GetMovieVideosLoadingState());
    final result = await getMovieVideosUseCase(id);
    result.fold(
      (failure) {
        emit(GetMovieVideosErrorState(errorMessage: failure.faiMessage));
      },
      (moviesList) async {
        _movieVideosList = moviesList;
        if (_movieVideosList.isNotEmpty) {
          _selectedMovieVideo = _movieVideosList.last;
          _currentMovieId = id;
        }
        emit(GetMovieVideosSuccessState());
      },
    );
  }

  // Future<String?> getMovieThumbnail(String url) async {
  //   return await VideoThumbnail.thumbnailFile(
  //     video: url,
  //     //thumbnailPath: (await getTemporaryDirectory()).path,
  //     imageFormat: ImageFormat.PNG,
  //     maxHeight:
  //         64, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
  //     quality: 75,
  //   );
  // }
}
