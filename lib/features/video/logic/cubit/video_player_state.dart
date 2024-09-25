import 'package:video_player/video_player.dart';

abstract class VideoPlayerState {}

class VideoPlayerInitial extends VideoPlayerState {}

class VideoPlayerLoading extends VideoPlayerState {}

class VideoPlayerLoaded extends VideoPlayerState {
  final VideoPlayerController videoPlayerController;

  VideoPlayerLoaded(this.videoPlayerController);
}

class VideoPlayerError extends VideoPlayerState {
  final String errorMessage;

  VideoPlayerError(this.errorMessage);
}
