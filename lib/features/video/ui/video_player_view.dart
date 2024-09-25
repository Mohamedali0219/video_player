import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vedio_player_app/features/video/logic/cubit/video_player_cubit.dart';
import 'package:vedio_player_app/features/video/logic/cubit/video_player_state.dart';

import 'package:video_player/video_player.dart';

class VideoPlayerView extends StatefulWidget {
  final String url;
  final DataSourceType dataSourceType;

  const VideoPlayerView({
    super.key,
    required this.url,
    required this.dataSourceType,
  });

  @override
  VideoPlayerViewState createState() => VideoPlayerViewState();
}

class VideoPlayerViewState extends State<VideoPlayerView> {
  ChewieController? chewieController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          VideoPlayerCubit()..loadVideo(widget.url, widget.dataSourceType),
      child: BlocListener<VideoPlayerCubit, VideoPlayerState>(
        listener: (context, state) {
          if (state is VideoPlayerLoaded) {
            chewieController = ChewieController(
              videoPlayerController: state.videoPlayerController,
              aspectRatio: 16 / 9,
              autoPlay: true,
              looping: false,
              showControls: true,
              customControls: const MaterialControls(),
              allowFullScreen: true,
              allowMuting: true,
            );
          } else if (state is VideoPlayerError || state is VideoPlayerInitial) {
            chewieController?.dispose();
            chewieController = null;
          }
        },
        child: BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
          builder: (context, state) {
            if (state is VideoPlayerLoading) {
              return AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: Colors.black,
                  child: const Center(child: CircularProgressIndicator()),
                ),
              );
            } else if (state is VideoPlayerLoaded) {
              return AspectRatio(
                aspectRatio: 16 / 9,
                child: Chewie(controller: chewieController!),
              );
            } else if (state is VideoPlayerError) {
              return Center(child: Text('Error: ${state.errorMessage}'));
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    chewieController?.dispose();
    super.dispose();
  }
}
