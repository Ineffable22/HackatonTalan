import 'dart:convert';

import 'package:flutter/cupertino.dart';


class UserLoginDto {
  String username = "";
  String password = "";
  String fcmTokem = "";

  String toJson() {
    return jsonEncode({
      "email": username,
      "password": password,
      "fcmtoken": fcmTokem
    });
  }
}


class UserLogin{
  UserLoginDto _userLogin = UserLoginDto();

  UserLoginDto get userLogin => _userLogin;

  void setUsername(String value) {
    _userLogin.username = value;
  }

  void setPassword(String value) {
    _userLogin.password = value;
  }

  void setFcmToken(String fcmToken) {
    _userLogin.fcmTokem = fcmToken;
  }

}