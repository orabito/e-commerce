import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/internet_checker.dart';
import 'package:ecommerce_app/features/auth/sign_in/data/data_source/SignInRemoteDataSource.dart';
import 'package:injectable/injectable.dart';

import '../../../sign_up/domain/entity/signUpEntity/signUpEntity.dart';
import '../../domain/domain/repository/sign_in_repository.dart';

@Injectable(as: SignInRepository)
class SignInRepositoryImp implements SignInRepository {
  SignInRemoteDataSource signInRemoteDataSource;

  @factoryMethod
  SignInRepositoryImp(this.signInRemoteDataSource);

  @override
  Future<Either<SignUpEntity,String>> signIn(String email, String password) async {
    bool isConnected = await InternetChecker.checkNetwork();
  if(isConnected){
    var result = await signInRemoteDataSource.signIn( email, password);
    return result.fold(
          (response) async {

        return Left(response.toSignUpEntity());
      },
          (error) {
        return Right(error);
      },
    );

  }
  else{
   return Right("No Internet connection");
    }
  }
}
