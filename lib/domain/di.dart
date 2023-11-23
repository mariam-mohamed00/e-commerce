import 'package:e_commerce/data/model/api/api_manager.dart';
import 'package:e_commerce/data/repository/data_source/auth_remote_data_source_impl.dart';
import 'package:e_commerce/data/repository/data_source/home_remote_data_source_impl.dart';
import 'package:e_commerce/data/repository/repository/auth_repository_impl.dart';
import 'package:e_commerce/data/repository/repository/home_repository_impl.dart';
import 'package:e_commerce/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:e_commerce/domain/repository/data_source/home_remote_data_source.dart';
import 'package:e_commerce/domain/repository/repository/auth_repository_contract.dart';
import 'package:e_commerce/domain/repository/repository/home_repository_contract.dart';
import 'package:e_commerce/domain/use_case/get_all_brands_use_case.dart';
import 'package:e_commerce/domain/use_case/get_all_categories_use_case.dart';
import 'package:e_commerce/domain/use_case/login_use_case.dart';
import 'package:e_commerce/domain/use_case/register_use_case.dart';

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(repositoryContract: injectAuthRepositoryContract());
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(repositoryContract: injectAuthRepositoryContract());
}

AuthRepositoryContract injectAuthRepositoryContract() {
  return AuthRepositoryImpl(remoteDataSource: injectAuthRepositoryDataSource());
}

AuthRemoteDataSource injectAuthRepositoryDataSource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

GetAllCategoriesUseCase injectGetAllCategoriesUseCase() {
  return GetAllCategoriesUseCase(
      repositoryContract: injectHomeRepositoryContract());
}

GetAllBrandsUseCase injectGetAllBrandsUseCase() {
  return GetAllBrandsUseCase(
      repositoryContract: injectHomeRepositoryContract());
}

HomeRepositoryContract injectHomeRepositoryContract() {
  return HomeRepositoryImpl(remoteDataSource: injectHomeRemoteDataSource());
}

HomeRemoteDataSource injectHomeRemoteDataSource() {
  return HomeRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
