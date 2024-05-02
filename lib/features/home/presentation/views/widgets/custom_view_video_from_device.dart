import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../../../constants.dart';

class CustomViewVideoFromDevice extends StatefulWidget {
  const CustomViewVideoFromDevice({
    Key? key,
    required this.file,
    required this.function,
  }) : super(key: key);

  final dynamic file;
  final Function() function;

  @override
  _CustomViewVideoFromDeviceState createState() =>
      _CustomViewVideoFromDeviceState();
}

class _CustomViewVideoFromDeviceState extends State<CustomViewVideoFromDevice> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    if (widget.file is File) {
      _videoController = VideoPlayerController.file(widget.file as File);
      _videoController.initialize().then((_) {
        setState(() {});
      });
      _videoController.play();
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
        decoration: BoxDecoration(
            border: Border.all(color: kPrimaryKey),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            _videoController.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _videoController.value.aspectRatio * 4,
                    child: VideoPlayer(_videoController),
                  )
                : Container(), // Show nothing if video is not initialized

            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 15,
              child: IconButton(
                onPressed: widget.function,
                icon: const Icon(
                  Icons.close,
                  color: kPrimaryKey,
                  size: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
