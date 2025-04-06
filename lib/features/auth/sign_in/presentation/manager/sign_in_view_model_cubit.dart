import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/auth/sign_in/domain/domain/use_case/Sign_In_use_case.dart';
import 'package:ecommerce_app/features/auth/sign_up/domain/entity/signUpEntity/signUpEntity.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'sign_in_view_model_state.dart';
@injectable
class SignInViewModelCubit extends Cubit<SignInViewModelState> {
  @factoryMethod
  SignInViewModelCubit(this.signInUseCase) : super(SignInViewModelInitial());
SignInUseCase signInUseCase;

signIn(String email,String password) async {

  emit(SignInLoadingState());
  var result=await signInUseCase.call(email, password);
  result.fold((entity){
emit(SignInSuccessState(entity));
  }, (error) {
emit(SignInErrorState(error));
        error.toString();
  },);
}



}
