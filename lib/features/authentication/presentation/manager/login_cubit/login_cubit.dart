import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_bet/core/api/end_ponits.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';
import 'package:post_bet/features/authentication/data/models/user_data_model/user_data_model.dart';
import 'package:post_bet/features/authentication/data/models/user_data_model/user_data_response_model.dart';
import 'package:post_bet/features/authentication/data/repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepository) : super(LoginInitial());

  final AuthRepository authRepository;
  static LoginCubit? get(context) => BlocProvider.of(context);
  IconData iconData = Icons.visibility_off;
  bool ifPasswordVisible = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController emailForForgetPasswordController =
      TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController verfyNewPasswordOtpController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  var formVerifyForgetOtpKey = GlobalKey<FormState>();
  var formVerifyEmailForgetOtpKey = GlobalKey<FormState>();

  void isVisiblePasswordEye() {
    ifPasswordVisible = !ifPasswordVisible;
    iconData = ifPasswordVisible ? Icons.visibility_off : Icons.remove_red_eye;
    emit(LoginIsPasswordVisibleEye());
  }

  signIn() async {
    emit(LoginLoading());
    final response = await authRepository.login(
      email: emailController.text,
      password: passwordController.text,
    );
    response.fold((errMessage) => emit(LoginFailure(errMessage: errMessage)),
        (signInModel) {
      emailController.clear();
      passwordController.clear();
      emit(LoginSuccess());
    });
  }

  UserDataModel? userData;
  getUserProfile() async {
    emit(GetUserLoading());
    final response = await authRepository.getUserProfile();
    response.fold(
      (errMessage) => emit(GetUserFailure(errMessage: errMessage)),
      (user) {
        userData = user.data;
        print(' hellloooooooooooooooooo ${user.data.name}');
        getIt
            .get<CashHelperSharedPreferences>()
            .saveData(key: ApiKey.name, value: user.data.name);
        getIt
            .get<CashHelperSharedPreferences>()
            .saveData(key: ApiKey.profilePic, value: user.data.profileImage);

        getIt
            .get<CashHelperSharedPreferences>()
            .saveData(key: ApiKey.email, value: user.data.email);

        emit(GetUserSuccess(user: user));
      },
    );
  }

  forgetPassword() async {
    emit(ForgetPasswordLoading());
    final response = await authRepository.forgetPassword(
      eamil: emailForForgetPasswordController.text,
    );
    response.fold(
        (errMessage) => emit(ForgetPasswordFailure(errMessage: errMessage)),
        (forgetpassword) async {
      await getIt.get<CashHelperSharedPreferences>().saveData(
          key: 'emailforgetPassword',
          value: emailForForgetPasswordController.text);
      emit(ForgetPasswordSuccess());
    });
  }

  verfyNewPasswordOtp() async {
    emit(VerifyForgetPasswordLoading());
    final response = await authRepository.verfyOtpForgetPassword(
      otp: verfyNewPasswordOtpController.text,
    );
    response.fold(
      (errMessage) => emit(VerifyForgetPasswordFailure(errMessage: errMessage)),
      (verify) {
        verfyNewPasswordOtpController.clear();
        emit(VerifyForgetPasswordSuccess());
      },
    );
  }

  changeForgetPassword() async {
    emit(NewForgetPasswordLoading());
    final response = await authRepository.changeForgetPassword(
      email: await getIt
              .get<CashHelperSharedPreferences>()
              .getData(key: 'emailforgetPassword') ??
          emailForForgetPasswordController.text,
      newPassword: newPasswordController.text,
    );
    response.fold(
      (errMessage) => emit(NewForgetPasswordFailure(errMessage: errMessage)),
      (verify) {
        newPasswordController.clear();
        emit(NewForgetPasswordSuccess());
      },
    );
  }
}
