import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vedio_player_app/features/video/data/repos/video_player_repo.dart';
import 'package:vedio_player_app/features/video/logic/cubit/video_player_state.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  final VideoPlayerRepository repository = VideoPlayerRepository();

  VideoPlayerCubit() : super(VideoPlayerInitial());

  Future<void> loadVideo(String url, DataSourceType sourceType) async {
    try {
      emit(VideoPlayerLoading());
      final controller = await repository.loadVideo(url, sourceType);
      emit(VideoPlayerLoaded(controller));
    } catch (error) {
      emit(VideoPlayerError(error.toString()));
    }
  }
}
