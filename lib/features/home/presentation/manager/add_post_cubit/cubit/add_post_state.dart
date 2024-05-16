part of 'add_post_cubit.dart';

@immutable
sealed class AddPostState {}

final class AddPostInitial extends AddPostState {}

class LoadingPickImage extends AddPostState {}

class SuccessfulPickImage extends AddPostState {}

class FailPickImage extends AddPostState {}

class RemoveFileImage extends AddPostState {}

class RemoveFileVideo extends AddPostState {}

class UploadImgSuccessfully extends AddPostState {}

class UploadImgFailure extends AddPostState {
  final String errMessage;

  UploadImgFailure({required this.errMessage});
}

class UploadImageLoading extends AddPostState {}

class CreatePostSuccessfully extends AddPostState {}

class CreatePostFailure extends AddPostState {
  final String errMessage;

  CreatePostFailure({required this.errMessage});
}

class CreatePostLoading extends AddPostState {}
