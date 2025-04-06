import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/auth/sign_up/domain/entity/signUpEntity/signUpEntity.dart';

abstract class SignInRepository {
Future<Either<SignUpEntity,String>>  signIn(String email, String password);

}