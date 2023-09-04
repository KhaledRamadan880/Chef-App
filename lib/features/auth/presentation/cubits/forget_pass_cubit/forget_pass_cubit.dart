import 'package:chef_app/features/auth/data/repository/auth_repository.dart';
import 'package:chef_app/features/auth/presentation/cubits/forget_pass_cubit/forget_pass_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPassCubit extends Cubit<ForgetPassState> {
  ForgetPassCubit(this.authRepository) : super(ForgetPassInitial());

  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> sendCodeKey = GlobalKey<FormState>();
  final AuthRepository authRepository;

  //! Send Code Method
  void sendCode() async {
    emit(SendCodeLoadingState());
    final res = await authRepository.sendCode(emailController.text);
    res.fold(
      (l) => emit(SendCodeErrorState(l)),
      (r) => emit(SendCodeSuccessState(r)),
    );
  }
}
