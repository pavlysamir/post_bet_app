import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit() : super(AddPostInitial());
  static AddPostCubit get(BuildContext context) => BlocProvider.of(context);

  TextEditingController addPostController = TextEditingController();

  File? fileImage;
  Future<void> pickCameraImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      fileImage = File(image.path);
      emit(SuccessfulPickImage());
    } else {
      emit(FailPickImage());
      return;
    }
  }

  File? fileVideo;
  Future<void> pickCameraVideo() async {
    final video = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (video != null) {
      fileVideo = File(video.path);
      print(fileVideo.toString());
      emit(SuccessfulPickImage());
    } else {
      emit(FailPickImage());
      return;
    }
  }

  void clearImage() {
    fileImage = null;
    emit(RemoveFileImage());
  }

  void clearVideo() {
    fileVideo = null;
    emit(RemoveFileVideo());
  }
}
