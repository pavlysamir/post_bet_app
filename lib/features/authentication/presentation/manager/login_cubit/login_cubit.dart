import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_bet/features/authentication/data/repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepository) : super(LoginInitial());

  final AuthRepository authRepository;
  static LoginCubit? get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void isVisiblePasswordEye() {
    emit(LoginIsPasswordVisibleEye());
  }

  signIn() async {
    emit(LoginLoading());
    final response = await authRepository.login(
      email: emailController.text,
      password: passwordController.text,
    );
    response.fold(
      (errMessage) => emit(LoginFailure(errMessage: errMessage)),
      (signInModel) => emit(LoginSuccess()),
    );
  }
}
