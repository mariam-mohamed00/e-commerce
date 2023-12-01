import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/api/api_constants.dart';
import 'package:e_commerce/data/model/request/LoginRequest.dart';
import 'package:e_commerce/data/model/request/RegisterRequest.dart';
import 'package:e_commerce/data/model/response/CategoryOrBrandResponseDto.dart';
import 'package:e_commerce/data/model/response/LoginResponseDto.dart';
import 'package:e_commerce/data/model/response/RegisterResponseDto.dart';
import 'package:e_commerce/domain/failures.dart';
import 'package:http/http.dart' as http;

import '../response/ProductResponseDto.dart';

class ApiManager {
  ApiManager._();

  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<Either<Failures, RegisterResponseDto>> register(String name,
      String email, String password, String rePassword, String phone) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.registerApi);

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var registerBody = RegisterRequest(
          name: name,
          phone: phone,
          email: email,
          password: password,
          rePassword: rePassword);
      var response = await http.post(url, body: registerBody.toJson());
      var registerResponse =
          RegisterResponseDto.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(registerResponse);
      } else {
        return Left(ServerError(
            errorMessage: registerResponse.error != null
                ? registerResponse.error!.msg!
                : registerResponse.message));
      }
    } else {
      return left(
          NetworkError(errorMessage: 'Please check internet connection'));
    }
  }

  Future<Either<Failures, LoginResponseDto>> login(
      String email, String password) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.loginApi);

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var loginBody = LoginRequest(email: email, password: password);
      var response = await http.post(url, body: loginBody.toJson());
      var loginResponse = LoginResponseDto.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(loginResponse);
      } else {
        return Left(ServerError(errorMessage: loginResponse.message));
      }
    } else {
      return left(
          NetworkError(errorMessage: 'Please check internet connection'));
    }
  }

  Future<Either<Failures, CategoryOrBrandResponseDto>> getCategories() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.getAllCategoriesApi);

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var response = await http.get(url);
      var categoryResponse =
          CategoryOrBrandResponseDto.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(categoryResponse);
      } else {
        return Left(ServerError(errorMessage: categoryResponse.message));
      }
    } else {
      return left(
          NetworkError(errorMessage: 'Please check internet connection'));
    }
  }

  Future<Either<Failures, CategoryOrBrandResponseDto>> getBrands() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.getAllBrandsApi);

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var response = await http.get(url);
      var categoryOrBrandResponse =
          CategoryOrBrandResponseDto.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(categoryOrBrandResponse);
      } else {
        return Left(ServerError(errorMessage: categoryOrBrandResponse.message));
      }
    } else {
      return left(
          NetworkError(errorMessage: 'Please check internet connection'));
    }
  }

  Future<Either<Failures, ProductResponseDto>> getProducts() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.getAllProductsApi);
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var response = await http.get(url);
      var ProductResponse =
          ProductResponseDto.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(ProductResponse);
      } else {
        return Left(ServerError(errorMessage: ProductResponse.message));
      }
    } else {
      return left(
          NetworkError(errorMessage: 'Please check internet connection'));
    }
  }
}
