import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/auth/sign_up/data/model/signUp_response/sign_up_response.dart';

abstract class SignInRemoteDataSource {
  Future<Either<SignUpResponse,String>> signIn(String email,String password);
}
