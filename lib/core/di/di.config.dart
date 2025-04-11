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
import '../../features/main_layout/categories/data/data_source/categories_remote_data_source.dart'
    as _i902;
import '../../features/main_layout/categories/data/data_source/CategoriesRemoteDataSourceImp/SubCategoriesRemoteDataSourceImp.dart'
    as _i527;
import '../../features/main_layout/categories/data/repository/SubCategoriesRepositoryImp.dart'
    as _i420;
import '../../features/main_layout/categories/domain/repository/SubCategoriesRepository.dart'
    as _i392;
import '../../features/main_layout/categories/domain/use_case/get_sub_categories_use_case.dart'
    as _i90;
import '../../features/main_layout/categories/presentation/manager/categories_cubit.dart'
    as _i384;
import '../../features/main_layout/home/data/data_source/home_remote_data_source.dart'
    as _i197;
import '../../features/main_layout/home/data/data_source/HomeDataSourceImp/HomeRemoteDataSourceImp.dart'
    as _i555;
import '../../features/main_layout/home/data/repository/home_repository_imp.dart'
    as _i1029;
import '../../features/main_layout/home/domain/repository/home_repository.dart'
    as _i556;
import '../../features/main_layout/home/domain/use_case/get_categories_use_case.dart'
    as _i230;
import '../../features/main_layout/home/presentation/manager/home_cubit.dart'
    as _i404;
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
    gh.factory<_i404.HomeCubit>(
        () => _i404.HomeCubit(gh<_i230.GetCategoriesUseCase>()));
    gh.factory<_i902.SubCategoriesRemoteDataSource>(
        () => _i527.SubCategoriesRemoteDataSourceImp(gh<_i282.ApiManger>()));
    gh.factory<_i413.SignInRemoteDataSource>(
        () => _i592.SignInRemoteDataSourceImp(gh<_i282.ApiManger>()));
    gh.factory<_i197.HomeRemoteDataSource>(
        () => _i555.HomeRemoteDataSourceImp(gh<_i282.ApiManger>()));
    gh.factory<_i277.SignUpDataSource>(
        () => _i504.SignUpAPIDataSourceImp(gh<_i282.ApiManger>()));
    gh.factory<_i428.SignInRepository>(
        () => _i601.SignInRepositoryImp(gh<_i413.SignInRemoteDataSource>()));
    gh.factory<_i392.SubCategoriesRepository>(() =>
        _i420.SubCategoriesRepositoryImp(
            gh<_i902.SubCategoriesRemoteDataSource>()));
    gh.factory<_i556.HomeRepository>(
        () => _i1029.HomeRepositoryImp(gh<_i197.HomeRemoteDataSource>()));
    gh.factory<_i287.SignInUseCase>(
        () => _i287.SignInUseCase(gh<_i428.SignInRepository>()));
    gh.factory<_i988.SignUpRepository>(
        () => _i948.SignUpRepositoryImp(gh<_i277.SignUpDataSource>()));
    gh.factory<_i228.SignupUseCase>(
        () => _i228.SignupUseCase(gh<_i988.SignUpRepository>()));
    gh.factory<_i586.SignInViewModelCubit>(
        () => _i586.SignInViewModelCubit(gh<_i287.SignInUseCase>()));
    gh.factory<_i90.GetSubCategoriesUseCase>(() =>
        _i90.GetSubCategoriesUseCase(gh<_i392.SubCategoriesRepository>()));
    gh.factory<_i230.GetCategoriesUseCase>(
        () => _i230.GetCategoriesUseCase(gh<_i556.HomeRepository>()));
    gh.factory<_i794.SignUpViewModelCubit>(
        () => _i794.SignUpViewModelCubit(gh<_i228.SignupUseCase>()));
    gh.factory<_i384.CategoriesCubit>(() => _i384.CategoriesCubit(
          gh<_i230.GetCategoriesUseCase>(),
          gh<_i90.GetSubCategoriesUseCase>(),
        ));
    return this;
  }
}
