import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_bet/features/profile/presentation/manager/edit%20profile%20state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(InitialEditProfileState());

  static EditProfileCubit get(BuildContext context) => BlocProvider.of(context);

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void isVisiblePasswordEye() {
    emit(EditProfileIsPasswordVisibleEye());
  }

  void isVisibleConformPasswordEye() {
    emit(EditProfileIsConfirmPasswordVisibleEye());
  }
}
