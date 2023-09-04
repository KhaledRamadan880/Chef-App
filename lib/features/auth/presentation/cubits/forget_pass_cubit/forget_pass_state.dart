class ForgetPassState {}

final class ForgetPassInitial extends ForgetPassState {}

final class SendCodeLoadingState extends ForgetPassState {}

final class SendCodeSuccessState extends ForgetPassState {
  final String email;

  SendCodeSuccessState(this.email);
}

final class SendCodeErrorState extends ForgetPassState {
  final String message;

  SendCodeErrorState(this.message);
}
