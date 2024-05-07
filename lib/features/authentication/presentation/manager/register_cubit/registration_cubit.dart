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

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit(this.authRepository) : super(RegistrationInitial());

  final AuthRepository authRepository;

  static RegistrationCubit? get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  IconData iconDataPassword = Icons.visibility_off;

  IconData iconDataConfirmPassword = Icons.visibility_off;

  bool ifPasswordVisible = true;

  bool ifConfirmPasswordVisible = true;

  var formKey = GlobalKey<FormState>();
  void isVisiblePasswordEye() {
    ifPasswordVisible = !ifPasswordVisible;
    iconDataPassword =
        ifPasswordVisible ? Icons.visibility_off : Icons.remove_red_eye;
    emit(RegisterIsPasswordVisibleEye());
  }

  void isVisibleConformPasswordEye() {
    ifConfirmPasswordVisible = !ifConfirmPasswordVisible;
    iconDataConfirmPassword =
        ifConfirmPasswordVisible ? Icons.visibility_off : Icons.remove_red_eye;
    emit(RegisterIsConfirmPasswordVisibleEye());
  }

  signUp() async {
    emit(SignUpLoading());
    final response = await authRepository.signUp(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    response.fold((errMessage) => emit(SignUpFailure(errMessage: errMessage)),
        (signUpModel) async {
      await getIt
          .get<CashHelperSharedPreferences>()
          .saveData(key: ApiKey.verfyAccount, value: emailController.text);

      emailController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      nameController.clear();
      phoneController.clear();

      emit(SignUpSuccess(data: signUpModel.data));
    });
  }

  TextEditingController verfyAccountOtpController = TextEditingController();
  var verfyFormKey = GlobalKey<FormState>();
  // verfyOtp() async {
  //   emit(VerfyOtpLoading());
  //   final response = await authRepository.verfyOtp(
  //     otp: verfyController.text,
  //   );
  //   response.fold(
  //     (errMessage) => emit(VerfyOtpFailure(errMessage: errMessage)),
  //     (signUpModel) => emit(VerfyOtpSuccess()),
  //   );
  // }

  verfyAccountOtp() async {
    emit(VerfyOtpLoading());
    final response = await authRepository.verfyAccount(
      eamil: await getIt
              .get<CashHelperSharedPreferences>()
              .getData(key: ApiKey.verfyAccount) ??
          emailController.text,
      otp: verfyAccountOtpController.text,
    );
    response.fold(
      (errMessage) => emit(VerfyOtpFailure(errMessage: errMessage)),
      (signUpModel) => emit(VerfyOtpSuccess()),
    );
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
}
