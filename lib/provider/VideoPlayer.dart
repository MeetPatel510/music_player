import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../models/VideoModel.dart';
import '../utils/VideoDetails.dart';

class VideoProvider extends ChangeNotifier {
  VideoModel videoModel;

  VideoProvider({required this.videoModel});

  videoInitialization() {
    videoModel.videoPlayerController =
    VideoPlayerController.asset(allVideos[index]['video'])
      ..initialize();
    notifyListeners();

    videoModel.chewieController = ChewieController(
      videoPlayerController: videoModel.videoPlayerController!,
      autoPlay: false,
      fullScreenByDefault: true,
      allowFullScreen: true,
    );
    notifyListeners();
  }

  videoDeactivate() async {
    await videoModel.videoPlayerController!.pause();
    await videoModel.chewieController!.pause();
    notifyListeners();
  }
}
