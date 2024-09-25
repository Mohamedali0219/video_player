import 'package:flutter/material.dart';
import 'package:vedio_player_app/features/video/ui/video_player_view.dart';
import 'package:video_player/video_player.dart';

class VideoPlayersScreen extends StatelessWidget {
  const VideoPlayersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video Players')),
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: const [
          // Network
          VideoPlayerView(
            url:
                'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4',
            dataSourceType: DataSourceType.network,
          ),
        ],
      ),
    );
  }
}
