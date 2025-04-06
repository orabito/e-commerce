import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/auth/sign_up/domain/entity/signUpEntity/signUpEntity.dart';

abstract class SignUpRepository {


 Future<Either<SignUpEntity,String>> registerUser({
    required String name,
    required String email,
    required String password,
    required String rePassword,
    required String phone
});
}