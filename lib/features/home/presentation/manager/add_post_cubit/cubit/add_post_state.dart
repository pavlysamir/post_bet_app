part of 'add_post_cubit.dart';

@immutable
sealed class AddPostState {}

final class AddPostInitial extends AddPostState {}

class LoadingPickImage extends AddPostState {}

class SuccessfulPickImage extends AddPostState {}

class FailPickImage extends AddPostState {}

class RemoveFileImage extends AddPostState {}

class RemoveFileVideo extends AddPostState {}

class RemovePostContant extends AddPostState {}

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

class UploadVideoSuccessfully extends AddPostState {}

class UploadVideoFailure extends AddPostState {
  final String errMessage;

  UploadVideoFailure({required this.errMessage});
}

class UploadVideoLoading extends AddPostState {}

class VerifyVideoSuccessfully extends AddPostState {}

class VerifyVideoFailure extends AddPostState {
  final String errMessage;

  VerifyVideoFailure({required this.errMessage});
}

class VerifyVideoLoading extends AddPostState {}

class GetVideoSuccessfully extends AddPostState {}

class GetVideoFailure extends AddPostState {
  final String errMessage;

  GetVideoFailure({required this.errMessage});
}

class GetVideoLoading extends AddPostState {}
