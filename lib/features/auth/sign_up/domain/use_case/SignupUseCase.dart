import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/auth/sign_up/domain/entity/signUpEntity/signUpEntity.dart';
import 'package:ecommerce_app/features/auth/sign_up/domain/repository/sign_up_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupUseCase {
  SignUpRepository signUpRepository;

  @factoryMethod
  SignupUseCase(this.signUpRepository);

Future<Either<SignUpEntity,String>>  call(
          {required String name,
          required String email,
          required String password,
          required String rePassword,
          required String phone}) =>
      signUpRepository.registerUser(
          name: name,
          email: email,
          password: password,
          rePassword: rePassword,
          phone: phone);
}
