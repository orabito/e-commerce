import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/remote/Api_manger.dart';
import 'package:ecommerce_app/core/remote/end_points.dart';
import 'package:ecommerce_app/features/auth/sign_up/data/data_source/SignUpDataSource.dart';
import 'package:ecommerce_app/features/auth/sign_up/data/model/signUp_response/sign_up_response.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:SignUpDataSource )
class SignUpAPIDataSourceImp extends SignUpDataSource {
  ApiManger apiManger;

  @factoryMethod
  SignUpAPIDataSourceImp(this.apiManger,);
  @override
  Future<Either<SignUpResponse, String>> registerUser(
      {required String name,
      required String email,
      required String password,
      required String rePassword,
      required String phone}) async {
 try {
   var response = await apiManger.postRequestRow(path: EndPoints.signUp,
      body: {
        "name":name,
        "email":email,
        "password":password,
        "phone":phone,
        "rePassword":rePassword
      });
   SignUpResponse signUpResponse=SignUpResponse.fromJson(response.data);
   if(signUpResponse.statusMsg!=null){

     return Right(signUpResponse.message!);
   }else{

     return Left(signUpResponse);
   }
 } on Exception catch (e) {
return Right(e.toString());

 }




  }
}
