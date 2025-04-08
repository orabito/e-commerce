part of 'sign_in_view_model_cubit.dart';

@immutable
sealed class SignInViewModelState {}

final class SignInViewModelInitial extends SignInViewModelState {}
final class SignInLoadingState extends SignInViewModelState {}
final class SignInSuccessState extends SignInViewModelState {
 final SignUpEntity entity;
  SignInSuccessState(this.entity);
}
final class SignInErrorState extends SignInViewModelState {
 final String errorMassage;
  SignInErrorState(this.errorMassage);
}

