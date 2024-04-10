import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());

  static RegistrationCubit? get(context) => BlocProvider.of(context);

  void isVisiblePasswordEye() {
    emit(RegisterIsPasswordVisibleEye());
  }

  void isVisibleConformPasswordEye() {
    emit(RegisterIsConfirmPasswordVisibleEye());
  }
}
