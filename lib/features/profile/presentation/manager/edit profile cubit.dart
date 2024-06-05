import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:post_bet/core/api/end_ponits.dart';
import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';
import 'package:post_bet/features/profile/data/profile_repo/profile_repo.dart';
import 'package:post_bet/features/profile/presentation/manager/edit%20profile%20state.dart';

import '../../../../core/utils/service_locator.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this.profileRepository) : super(InitialEditProfileState());

  final ProfileRepository profileRepository;

  static EditProfileCubit get(BuildContext context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String? base64Image;
  File? file;
  Future<void> pickCameraImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      final bytes = await File(image.path).readAsBytes();
      base64Image = base64Encode(bytes);
      print('pppppppppppppppppppppppppppppppppppppppppppppp$base64Image');
      file = File(image.path);
      print(file);
      emit(SuccessfulPickImage());
    } else {
      emit(FailPickImage());
      return;
    }
  }

  updateUserData() async {
    emit(UpdateUserDataLoading());
    final response = await profileRepository.updateProfileData(
      name: nameController.text,
      email: emailController.text,
      profilePic: base64Image ??
          'https://firebasestorage.googleapis.com/v0/b/yappy-app-ef720.appspot.com/o/posts%2FprofileImg.png?alt=media&token=1ad84aae-172b-4b68-b199-d59ab8e7107d',
    );
    response.fold(
      (errMessage) => emit(UpdateUserDataFailure(errMessage: errMessage)),
      (userData) {
        removeProfileCashedData();

        emit(UpdateUserDataSuccess());
        getIt
            .get<CashHelperSharedPreferences>()
            .saveData(key: ApiKey.name, value: nameController.text);
        getIt
            .get<CashHelperSharedPreferences>()
            .saveData(key: ApiKey.profilePic, value: base64Image);
        print(base64Image);

        getIt
            .get<CashHelperSharedPreferences>()
            .saveData(key: ApiKey.email, value: emailController.text);
      },
    );
  }

  void removeProfileCashedData() {
    getIt.get<CashHelperSharedPreferences>().removeData(key: ApiKey.name);
    getIt.get<CashHelperSharedPreferences>().removeData(key: ApiKey.email);

    getIt.get<CashHelperSharedPreferences>().removeData(key: ApiKey.profilePic);
  }
}
