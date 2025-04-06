// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/sign_in/data/data_source/SignInRemoteDataSource.dart'
    as _i413;
import '../../features/auth/sign_in/data/data_source/SignInRemoteDataSourceImp/SignInRemoteDataSourceImp.dart'
    as _i592;
import '../../features/auth/sign_in/data/repository/sign_in_repository_imp.dart'
    as _i601;
import '../../features/auth/sign_in/domain/domain/repository/sign_in_repository.dart'
    as _i428;
import '../../features/auth/sign_in/domain/domain/use_case/Sign_In_use_case.dart'
    as _i287;
import '../../features/auth/sign_in/presentation/manager/sign_in_view_model_cubit.dart'
    as _i586;
import '../../features/auth/sign_up/data/data_source/impl/SignupApiDataSourceImp.dart'
    as _i504;
import '../../features/auth/sign_up/data/data_source/SignUpDataSource.dart'
    as _i277;
import '../../features/auth/sign_up/data/repository/sign_up_repository_imp.dart'
    as _i948;
import '../../features/auth/sign_up/domain/repository/sign_up_repository.dart'
    as _i988;
import '../../features/auth/sign_up/domain/use_case/SignupUseCase.dart'
    as _i228;
import '../../features/auth/sign_up/presentation/manager/sign_up_view_model_cubit.dart'
    as _i794;
import '../remote/Api_manger.dart' as _i282;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i282.ApiManger>(() => _i282.ApiManger());
    gh.factory<_i413.SignInRemoteDataSource>(
        () => _i592.SignInRemoteDataSourceImp(gh<_i282.ApiManger>()));
    gh.factory<_i277.SignUpDataSource>(
        () => _i504.SignUpAPIDataSourceImp(gh<_i282.ApiManger>()));
    gh.factory<_i428.SignInRepository>(
        () => _i601.SignInRepositoryImp(gh<_i413.SignInRemoteDataSource>()));
    gh.factory<_i287.SignInUseCase>(
        () => _i287.SignInUseCase(gh<_i428.SignInRepository>()));
    gh.factory<_i988.SignUpRepository>(
        () => _i948.SignUpRepositoryImp(gh<_i277.SignUpDataSource>()));
    gh.factory<_i228.SignupUseCase>(
        () => _i228.SignupUseCase(gh<_i988.SignUpRepository>()));
    gh.factory<_i586.SignInViewModelCubit>(
        () => _i586.SignInViewModelCubit(gh<_i287.SignInUseCase>()));
    gh.factory<_i794.SignUpViewModelCubit>(
        () => _i794.SignUpViewModelCubit(gh<_i228.SignupUseCase>()));
    return this;
  }
}
