import 'package:e_commerce/domain/entity/auth_result_entity.dart';

import 'Errors.dart';
import 'UserDto.dart';

class RegisterResponseDto {
  RegisterResponseDto(
      {this.message, this.user, this.token, this.statusMsg, this.error});

  RegisterResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    error =
        json['errors'] != null ? ErrorResponse.fromJson(json['errors']) : null;
    token = json['token'];
  }

  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;
  ErrorResponse? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

  AuthResultEntity toAuthResultEntity() {
    return AuthResultEntity(token: token, userEntity: user?.toUserEntity());
  }
}
