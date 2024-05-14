import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_bet/features/platform/data/repo/platforms_repo.dart';

part 'platform_state.dart';

class PlatformCubit extends Cubit<PlatformState> {
  PlatformCubit(this.platFormsRepositery) : super(PlatformInitial());

  final PlatFormsRepositery platFormsRepositery;

  static PlatformCubit? get(context) => BlocProvider.of(context);

  linkAcount() async {
    emit(LinkAcoountLoading());
    try {
      final response = await platFormsRepositery.linkAccount();
      print(response);

      emit(LinkAcoountSuccess());
    } catch (e) {
      emit(LinkAcoountFailure(errMessage: e.toString()));
    }
  }
}
