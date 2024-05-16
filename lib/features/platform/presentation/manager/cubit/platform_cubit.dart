import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_bet/features/platform/data/models/ayrshare_model.dart';
import 'package:post_bet/features/platform/data/repo/platforms_repo.dart';

part 'platform_state.dart';

class PlatformCubit extends Cubit<PlatformState> {
  PlatformCubit(this.platFormsRepositery) : super(PlatformInitial());

  final PlatFormsRepositery platFormsRepositery;

  static PlatformCubit? get(context) => BlocProvider.of(context);

  String url = '';
  Future<String> linkAcount() async {
    emit(LinkAcoountLoading());
    final response = await platFormsRepositery.linkAccount();
    response.fold((l) {
      emit(LinkAcoountFailure(errMessage: l));
    }, (r) {
      url = r;
      print(url);
      emit(LinkAcoountSuccess());
    });
    return url;
  }
}
