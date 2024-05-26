import 'dart:io';
import 'package:flutter/material.dart';
import 'package:post_bet/constants.dart';
import 'package:video_player/video_player.dart';

class CustomViewVideoPost extends StatefulWidget {
  const CustomViewVideoPost({
    Key? key,
    required this.file,
  }) : super(key: key);

  final dynamic file;

  @override
  _CustomViewVideoPostState createState() => _CustomViewVideoPostState();
}

class _CustomViewVideoPostState extends State<CustomViewVideoPost> {
  late VideoPlayerController _videoController;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() {
    if (widget.file is String) {
      _videoController = VideoPlayerController.network(widget.file as String)
        ..initialize().then((_) {
          setState(() {
            _isInitialized = true;
          });
          _videoController.play();
        }).catchError((error) {
          // Handle initialization error
          print('Error initializing video: $error');
        });
    } else if (widget.file is File) {
      _videoController = VideoPlayerController.file(widget.file as File)
        ..initialize().then((_) {
          setState(() {
            _isInitialized = true;
          });
          _videoController.play();
        }).catchError((error) {
          // Handle initialization error
          print('Error initializing video: $error');
        });
    }
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.13,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            _isInitialized
                ? AspectRatio(
                    aspectRatio: _videoController.value.aspectRatio * 4,
                    child: VideoPlayer(_videoController),
                  )
                : const Center(
                    child: CircularProgressIndicator(
                    color: kPrimaryKey,
                  )),
          ],
        ),
      ),
    );
  }
}
