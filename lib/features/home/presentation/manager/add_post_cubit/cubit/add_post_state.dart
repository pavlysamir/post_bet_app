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

class UploadFaceBookReelSuccessfully extends AddPostState {}

class UploadFaceBookReelFailure extends AddPostState {
  final String errMessage;

  UploadFaceBookReelFailure({required this.errMessage});
}

class UploadFaceBookReelLoading extends AddPostState {}

class UploadFaceBookImageStorySuccessfully extends AddPostState {}

class RemovePostImagePickedState extends AddPostState {}

class UploadFaceBookImageStoryFailure extends AddPostState {
  final String errMessage;

  UploadFaceBookImageStoryFailure({required this.errMessage});
}

class UploadFaceBookImageStoryLoading extends AddPostState {}

class VerifyVideoSuccessfully extends AddPostState {}

class VerifyVideoFailure extends AddPostState {
  final String errMessage;

  VerifyVideoFailure({required this.errMessage});
}

class VerifyVideoLoading extends AddPostState {}

class CreateFaceBookReelSuccessfully extends AddPostState {}

class CreateFaceBookReelFailure extends AddPostState {
  final String errMessage;

  CreateFaceBookReelFailure({required this.errMessage});
}

class CreateFaceBookReelLoading extends AddPostState {}

class CreateFaceBookStorySuccessfully extends AddPostState {}

class CreateFaceBookStoryFailure extends AddPostState {
  final String errMessage;

  CreateFaceBookStoryFailure({required this.errMessage});
}

class CreateFaceBookStoryLoading extends AddPostState {}

class CreateVideoPostSuccessfully extends AddPostState {}

class CreateVideoPostFailure extends AddPostState {
  final String errMessage;

  CreateVideoPostFailure({required this.errMessage});
}

class CreateVideoPostLoading extends AddPostState {}
