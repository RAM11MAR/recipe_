import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/common/common.dart';
import 'package:video_player/video_player.dart';

class RecipeDetailVideo extends StatefulWidget {
  const RecipeDetailVideo({
    super.key,
    required this.videoUrl,
  });

  final String videoUrl;

  @override
  State<RecipeDetailVideo> createState() => _RecipeDetailVideoState();
}

class _RecipeDetailVideoState extends State<RecipeDetailVideo> {
  late final VideoPlayerController controller;

  late final Timer timer;

  @override
  void initState() {
    super.initState();
    // shu pageni ochganda yonchasiga ko'rinishi uchun
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    controller.initialize().then(
          (value) => setState(() {
            controller.play();
          }),
        );
    timer = Timer.periodic(Duration(seconds: 1), (timer) => setState(() {}));
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    controller.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              GestureDetector(
                onTap: () {
                  if (controller.value.isPlaying) {
                    controller.pause();
                  } else {
                    controller.play();
                  }
                  setState(() {});
                },
                child: VideoPlayer(controller),
              ),
              Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 15,
                  child: VideoProgressIndicator(controller, allowScrubbing: true),
                ),
              ),
              if (!controller.value.isPlaying)
                Center(
                  child: RecipeIconButtonContainer(
                    image: "assets/icons/play.svg",
                    callback: () {
                      controller.play();
                      setState(() {});
                    },
                    iconWidth: 30,
                    iconHeight: 40,
                    containerWidth: 74,
                    containerHeight: 74,
                    containerColor: AppColors.redPinkMain,
                    iconColor: Colors.white,
                  ),
                ),
              Positioned(
                bottom: 60,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.seekTo(controller.value.position - Duration(seconds: 5));
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.setVolume(0.5);
                      },
                      icon: Icon(Icons.add),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.seekTo(controller.value.position + Duration(seconds: 5));
                      },
                      icon: Icon(Icons.arrow_forward),
                    ),
                    Text(controller.value.position.inSeconds.toString()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// video_player
// VideoPlayerController
//   .play, pause, seekTo, value.isPlaying, value.position, setPlaybackSpeed, setVolume 0 1
// SystemChrome.setPreferredOrientations
