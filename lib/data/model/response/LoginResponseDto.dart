import '../../../domain/entity/auth_result_entity.dart';
import 'UserDto.dart';

/// message : "success"
/// user : {"name":"mariam mohamed","email":"mariammmmm@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NGE1NDIxMjE0MWJmMzExZmZjNDRjZSIsIm5hbWUiOiJtYXJpYW0gbW9oYW1lZCIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjk5Mzg3NTQ1LCJleHAiOjE3MDcxNjM1NDV9.9l6Vxjspx_xvZAL37y3tcLCiYUXYN1U45xpx_GjRrQo"

class LoginResponseDto {
  LoginResponseDto({this.message, this.user, this.token, this.statusMsg});

  LoginResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }

  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;

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

/// name : "mariam mohamed"
/// email : "mariammmmm@gmail.com"
/// role : "user"

class User {
  User({
    this.name,
    this.email,
    this.role,
  });

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? name;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }
}
