import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';

import '../../entity/ProductResponseEntity.dart';

abstract class HomeRepositoryContract {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getCategories();

  Future<Either<Failures, CategoryOrBrandResponseEntity>> getBrands();

  Future<Either<Failures, ProductResponseEntity>> getProducts();
}
