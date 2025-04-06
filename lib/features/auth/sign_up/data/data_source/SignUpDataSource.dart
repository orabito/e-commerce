 import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/auth/sign_up/data/model/signUp_response/sign_up_response.dart';

abstract class  SignUpDataSource {
 Future<Either<SignUpResponse,String>> registerUser({required String name,required String  email,required String password ,required String rePassword,required String phone });

}