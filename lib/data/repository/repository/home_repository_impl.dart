import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';
import 'package:e_commerce/domain/repository/data_source/home_remote_data_source.dart';
import 'package:e_commerce/domain/repository/repository/home_repository_contract.dart';

class HomeRepositoryImpl extends HomeRepositoryContract {
  HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getCategories() {
    return remoteDataSource.getCategories();
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getBrands() {
    return remoteDataSource.getBrands();
  }
}
