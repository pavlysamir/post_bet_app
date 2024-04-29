import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:post_bet/features/profile/presentation/manager/edit%20profile%20state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(InitialEditProfileState());

  static EditProfileCubit get(BuildContext context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  File? file;
  Future<void> pickCameraImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      file = File(image.path);
      emit(SuccessfulPickImage());
    } else {
      emit(FailPickImage());
      return;
    }
  }
}
