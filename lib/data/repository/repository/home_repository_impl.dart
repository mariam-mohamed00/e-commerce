import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/AddToCartResponseEntity.dart';
import 'package:e_commerce/domain/entity/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce/domain/entity/ProductResponseEntity.dart';
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

  @override
  Future<Either<Failures, ProductResponseEntity>> getProducts() {
    return remoteDataSource.getProducts();
  }

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(
      String productId) {
    return remoteDataSource.addToCart(productId);
  }
}
