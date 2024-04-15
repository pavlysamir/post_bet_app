import 'package:flutter_bloc/flutter_bloc.dart';

abstract class EditProfileState {}

class InitialEditProfileState extends EditProfileState {}

class EditProfileIsPasswordVisibleEye extends EditProfileState {}

class EditProfileIsConfirmPasswordVisibleEye extends EditProfileState {}
