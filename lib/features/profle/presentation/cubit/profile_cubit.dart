import 'package:chef_app/core/util/color.dart';
import 'package:chef_app/features/profle/data/repository/profile_repo.dart';
import 'package:chef_app/features/profle/presentation/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());

  TextEditingController oldPasscontroller = TextEditingController();
  TextEditingController newPasscontroller = TextEditingController();
  TextEditingController confirmcontroller = TextEditingController();

  GlobalKey<FormState> changePassKey = GlobalKey<FormState>();

  final ProfileRepo profileRepo;
  //! Change Password
  void changePass() async {
    emit(ChangePassLoadingState());
    final response = await profileRepo.changePassword(
      oldPass: oldPasscontroller.text,
      newPass: newPasscontroller.text,
      confirmPassword: confirmcontroller.text,
    );
    response.fold(
      (l) => emit(ChangePassErrorState(l)),
      (r) => emit(ChangePassSuccessState(r)),
    );
  }

  //* New Passs
  bool newPassIsVisible = false;
  bool newPassObscured = true;
  IconButton newPassSuffixIcon() {
    return IconButton(
      onPressed: () {
        newPassObscured = !newPassObscured;
        newPassIsVisible = !newPassIsVisible;
        emit(ChangedNewPassSuffixSccessState());
      },
      icon: newPassIsVisible
          ? const Icon(Icons.visibility, color: AppColors.primary)
          : const Icon(Icons.visibility_off, color: AppColors.primary),
    );
  }

  //* Confirm Passs

  bool confirmPassIsVisible = false;
  bool confirmPassObscured = true;
  IconButton confirmPassSuffixIcon() {
    return IconButton(
      onPressed: () {
        confirmPassObscured = !confirmPassObscured;
        confirmPassIsVisible = !confirmPassIsVisible;
        emit(ChangedConfirmPassSuffixSccessState());
      },
      icon: confirmPassIsVisible
          ? const Icon(Icons.visibility, color: AppColors.primary)
          : const Icon(Icons.visibility_off, color: AppColors.primary),
    );
  }

  //* Old Password
  TextEditingController codeController = TextEditingController();
  bool oldPassIsVisible = false;
  bool oldPassObscured = true;
  IconButton oldPassSuffixIcon() {
    return IconButton(
      onPressed: () {
        oldPassObscured = !oldPassObscured;
        oldPassIsVisible = !oldPassIsVisible;
        emit(ChangedOldPassSuffixSccessState());
      },
      icon: oldPassIsVisible
          ? const Icon(Icons.visibility, color: AppColors.primary)
          : const Icon(Icons.visibility_off, color: AppColors.primary),
    );
  }

  // //* Reset Password Method
  // void resetPass() async {
  //   emit(changePassLoading());
  //   final res = await authRepository.resetPass(
  //     email: emailController.text,
  //     newPAss: newPassController.text,
  //     confirmPassword: confirmPassController.text,
  //     code: codeController.text,
  //   );
  //   res.fold(
  //     (l) => emit(changePassError(l)),
  //     (r) => emit(changePassSuccess(r)),
  //   );
  // }
}
