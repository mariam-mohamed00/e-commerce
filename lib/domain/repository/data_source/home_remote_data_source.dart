import 'package:dartz/dartz.dart';

import '../../entity/CategoryOrBrandResponseEntity.dart';
import '../../entity/ProductResponseEntity.dart';
import '../../failures.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getCategories();

  Future<Either<Failures, CategoryOrBrandResponseEntity>> getBrands();

  Future<Either<Failures, ProductResponseEntity>> getProducts();
}
