import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_bet/features/activities/data/models/ayrshare_post_model.dart';
import 'package:post_bet/features/activities/data/repo/activities_repo.dart';

part 'get_posts_state.dart';

class GetPostsCubit extends Cubit<GetPostsState> {
  GetPostsCubit(this.activitiesRepo) : super(GetPostsInitial());

  final ActivitiesRepo activitiesRepo;
  static GetPostsCubit get(BuildContext context) => BlocProvider.of(context);
  List<AyrsharePostResponse> posts = [];
  getPosts() async {
    emit(GetPostsLoading());
    final response = await activitiesRepo.getPosts();
    response.fold(
      (errMessage) => emit(GetPostsError(errMessage)),
      (postsData) {
        posts = postsData;
        emit(GetPostsSuccess());
      },
    );
  }
}
