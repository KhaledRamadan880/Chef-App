import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/cache/cache.dart';
import 'package:chef_app/core/services/service_locator.dart';
import 'package:chef_app/features/auth/data/model/login_model.dart';
import 'package:chef_app/features/auth/data/repository/auth_repository.dart';
import 'package:chef_app/features/auth/presentation/cubits/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepository) : super(LoginInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  final AuthRepository authRepository;

  //! Login Method
  LoginModel? loginModel;
  void login() async {
    emit(LoginLoadingState());
    final res = await authRepository.login(
      email: emailController.text,
      password: passController.text,
    );
    res.fold(
      (l) => emit(LoginErrorState(l)),
      (r) async {
        loginModel = r;
        await sl<Cache>().setData(ApiKeys.token, r.token);        
        emit(LoginSuccessState());
      },
    );
  }
}
