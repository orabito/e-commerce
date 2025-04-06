import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/auth/sign_up/domain/entity/signUpEntity/signUpEntity.dart';
import 'package:ecommerce_app/features/auth/sign_up/domain/use_case/SignupUseCase.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_view_model_state.dart';

@injectable
class SignUpViewModelCubit extends Cubit<SignUpViewModelState> {
  @factoryMethod
  SignUpViewModelCubit(this.signupUseCase) : super(SignUpViewModelInitial());
  SignupUseCase signupUseCase;

  registerNewUser(
      {required String name,
      required String email,
      required String password,
      required String rePassword,
      required String phone}) async {
    // loading
    emit(SignUpLoadingState());
    var result = await signupUseCase.call(
        name: name,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone);

    return result.fold(
      (signupEntity) {
        //handel success
        emit(SignUpSuccessState(signupEntity));
      },
      (error) {
        emit(SignUpErrorState(error));
      },
    );
  }
}
