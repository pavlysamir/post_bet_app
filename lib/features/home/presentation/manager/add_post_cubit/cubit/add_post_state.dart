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

class CreateFacePostSuccessfully extends AddPostState {}

class CreateFacePostFailure extends AddPostState {
  final String errMessage;

  CreateFacePostFailure({required this.errMessage});
}

class CreateFacePostLoading extends AddPostState {}

class CreateFaceTextPostSuccessfully extends AddPostState {}

class CreateFaceTextPostFailure extends AddPostState {
  final String errMessage;

  CreateFaceTextPostFailure({required this.errMessage});
}

class CreateFaceTextPostLoading extends AddPostState {}

class CreateInstagramTextPostSuccessfully extends AddPostState {}

class CreateInstagramTextPostFailure extends AddPostState {
  final String errMessage;

  CreateInstagramTextPostFailure({required this.errMessage});
}

class CreateInstagramTextPostLoading extends AddPostState {}

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

class UploadInstagramImageStoryFailure extends AddPostState {
  final String errMessage;

  UploadInstagramImageStoryFailure({required this.errMessage});
}

class UploadInstagramImageStoryLoading extends AddPostState {}

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

class CreateInstagramReelSuccessfully extends AddPostState {}

class CreateInstagramReelFailure extends AddPostState {
  final String errMessage;

  CreateInstagramReelFailure({required this.errMessage});
}

class CreateInstagramReelLoading extends AddPostState {}

class CreateInstagramVideoStorySuccessfully extends AddPostState {}

class CreateInstagramVideoStoryFailure extends AddPostState {
  final String errMessage;

  CreateInstagramVideoStoryFailure({required this.errMessage});
}

class CreateInstagramVideoStoryLoading extends AddPostState {}

class CreateFaceBookVideoStorySuccessfully extends AddPostState {}

class CreateFaceBookVideoStoryFailure extends AddPostState {
  final String errMessage;

  CreateFaceBookVideoStoryFailure({required this.errMessage});
}

class CreateFaceBookVideoStoryLoading extends AddPostState {}

class CreateFaceBookStorySuccessfully extends AddPostState {}

class CreateFaceBookStoryFailure extends AddPostState {
  final String errMessage;

  CreateFaceBookStoryFailure({required this.errMessage});
}

class CreateFaceBookStoryLoading extends AddPostState {}

class CreateInstagramStorySuccessfully extends AddPostState {}

class CreateInstagramStoryFailure extends AddPostState {
  final String errMessage;

  CreateInstagramStoryFailure({required this.errMessage});
}

class CreateInstagramStoryLoading extends AddPostState {}

class CreateVideoPostSuccessfully extends AddPostState {}

class CreateVideoPostFailure extends AddPostState {
  final String errMessage;

  CreateVideoPostFailure({required this.errMessage});
}

class CreateVideoPostLoading extends AddPostState {}

class CreateFaceBookVideoPostSuccessfully extends AddPostState {}

class CreateFaceBookVideoPostFailure extends AddPostState {
  final String errMessage;

  CreateFaceBookVideoPostFailure({required this.errMessage});
}

class CreateFaceBookVideoPostLoading extends AddPostState {}

class CreateInstagramVideoPostSuccessfully extends AddPostState {}

class CreateInstagramVideoPostFailure extends AddPostState {
  final String errMessage;

  CreateInstagramVideoPostFailure({required this.errMessage});
}

class CreateInstagramVideoPostLoading extends AddPostState {}

class ShareActionSuccessfully extends AddPostState {}

class ShareActionFailure extends AddPostState {
  final String errMessage;

  ShareActionFailure({required this.errMessage});
}

class ShareActionLoading extends AddPostState {}
