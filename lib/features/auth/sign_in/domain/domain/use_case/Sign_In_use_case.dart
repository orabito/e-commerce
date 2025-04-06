import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/auth/sign_in/domain/domain/repository/sign_in_repository.dart';
import 'package:ecommerce_app/features/auth/sign_up/domain/entity/signUpEntity/signUpEntity.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInUseCase {
SignInRepository repo;
@factoryMethod
SignInUseCase(this.repo);
 Future<Either<SignUpEntity,String>>  call(String email,String password)=>repo.signIn(email, password) ;
}