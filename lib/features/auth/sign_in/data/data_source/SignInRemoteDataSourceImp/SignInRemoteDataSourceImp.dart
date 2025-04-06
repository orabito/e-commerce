
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/remote/Api_manger.dart';
import 'package:ecommerce_app/core/remote/end_points.dart';

import 'package:ecommerce_app/features/auth/sign_up/data/model/signUp_response/sign_up_response.dart';
import 'package:injectable/injectable.dart';

import '../SignInRemoteDataSource.dart';
@Injectable(as: SignInRemoteDataSource)
class SignInRemoteDataSourceImp implements SignInRemoteDataSource  {
  ApiManger apiManger;
  @factoryMethod
  SignInRemoteDataSourceImp(this.apiManger);
  @override
  Future<Either<SignUpResponse, String>> signIn(String email, String password) async {
    try{
      var result=await apiManger.postRequestRow(path:EndPoints.signIn,body: {
        "email":email,
        "password":password,
      });
SignUpResponse signInResponse =SignUpResponse.fromJson(result.data);
if(signInResponse.statusMsg!=null){
  return Right(signInResponse.message!);
}else{
  return Left(signInResponse);
}

    }catch(e){
      return Right(e.toString());
    }

  }

}