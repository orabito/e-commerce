import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/internet_checker.dart';
import 'package:ecommerce_app/features/auth/sign_up/data/data_source/SignUpDataSource.dart';

import 'package:ecommerce_app/features/auth/sign_up/domain/entity/signUpEntity/signUpEntity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/sign_up_repository.dart';

@Injectable(as: SignUpRepository)
class SignUpRepositoryImp implements SignUpRepository {
  SignUpDataSource signUpDataSource;
  // final  PrefsHelper _prefsHelper;this._prefsHelper
  @factoryMethod
  SignUpRepositoryImp(this.signUpDataSource,);

  @override
  Future<Either<SignUpEntity, String>> registerUser(
      {required String name,
      required String email,
      required String password,
      required String rePassword,
      required String phone}) async {
    bool isConnected = await InternetChecker.checkNetwork();
    if (isConnected) {
      var result = await signUpDataSource.registerUser(
          name: name,
          email: email,
          password: password,
          rePassword: rePassword,
          phone: phone);
      return result.fold(
        (response) async {
         // await PrefsHelper.saveUser(response.toSignUpEntity() as UserEntity);
          return Left(response.toSignUpEntity());
        },
        (error) {
          return Right(error);
        },
      );
    } else {
      return Right("No Internet connection");
    }
  }
}
