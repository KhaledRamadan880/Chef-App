class ForgetPassState {}

final class ForgetPassInitial extends ForgetPassState {}

final class SendCodeLoadingState extends ForgetPassState {}

final class ChangedNewPassSuffixSccessState extends ForgetPassState {}

final class ChangedConfirmPassSuffixSccessState extends ForgetPassState {}

final class SendCodeSuccessState extends ForgetPassState {
  final String email;

  SendCodeSuccessState(this.email);
}

final class SendCodeErrorState extends ForgetPassState {
  final String message;

  SendCodeErrorState(this.message);
}

final class changePassLoading extends ForgetPassState {}

final class changePassSuccess extends ForgetPassState {
  final String message;

  changePassSuccess(this.message);
}

final class changePassError extends ForgetPassState {
  final String message;

  changePassError(this.message);
}
