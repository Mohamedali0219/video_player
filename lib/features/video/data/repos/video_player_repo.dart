import 'dart:io';
import 'package:video_player/video_player.dart';

class VideoPlayerRepository {
  Future<VideoPlayerController> loadVideo(String url, DataSourceType sourceType) async {
    late VideoPlayerController videoPlayerController;

    // Initialize the controller based on the source type
    switch (sourceType) {
      case DataSourceType.asset:
        videoPlayerController = VideoPlayerController.asset(url);
        break;
      case DataSourceType.network:
        videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));
        break;
      case DataSourceType.file:
        videoPlayerController = VideoPlayerController.file(File(url));
        break;
      case DataSourceType.contentUri:
        videoPlayerController = VideoPlayerController.contentUri(Uri.parse(url));
        break;
    }

    // Asynchronously initialize the controller
    await videoPlayerController.initialize();
    return videoPlayerController;
  }
}
