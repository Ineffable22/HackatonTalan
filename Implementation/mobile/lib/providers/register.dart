import 'dart:convert';

import 'package:flutter/cupertino.dart';

class UserRegisterDto {
  String username = "";
  String name = "";
  String password = "";
  String repeatPassword = "";
  double? lat;
  double? long;

  String toJson() {
    return jsonEncode({
      "name": name,
      "email": username,
      "password": password,
      "lat": lat,
      "long": long
    });
  }
}


class UserRegister with ChangeNotifier{
  UserRegisterDto _userRegister = UserRegisterDto();
  bool _validCoor = false;

  UserRegisterDto get userRegister => _userRegister;
  bool get validCoor => _validCoor;

  void validateCoor()  {
    if (_userRegister.lat != null || _userRegister.lat != null) {
      _validCoor = true;


    } else {
      _validCoor = false;
    }
    notifyListeners();
  }

  void setLatLong(double lat, double long) {
    _userRegister.lat = lat;
    _userRegister.long = long;
  }

  void clear() {
    _userRegister.long = null;
    _userRegister.lat = null;
    _userRegister.password = "";
    _userRegister.name = "";
    _userRegister.username = "";

  }

  void setName(String value) {
    _userRegister.username = value;
  }

  void setUsername(String value) {
    _userRegister.username = value;
  }

  void setPassword(String value) {
    _userRegister.password = value;
  }

  void setRepeatPassword(String value) {
    _userRegister.repeatPassword = value;
  }

}