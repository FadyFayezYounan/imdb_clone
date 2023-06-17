import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'videos_state.dart';

class VideosCubit extends Cubit<VideosState> {
  VideosCubit() : super(VideosInitial());
}
