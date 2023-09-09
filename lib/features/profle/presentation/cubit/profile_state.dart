class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ChangedNewPassSuffixSccessState extends ProfileState {}

final class ChangedConfirmPassSuffixSccessState extends ProfileState {}

final class ChangedOldPassSuffixSccessState extends ProfileState {}

final class ChangePassErrorState extends ProfileState {
  final String message;

  ChangePassErrorState(this.message);
}

final class ChangePassSuccessState extends ProfileState {
  final String message;

  ChangePassSuccessState(this.message);
}

final class ChangePassLoadingState extends ProfileState {}
