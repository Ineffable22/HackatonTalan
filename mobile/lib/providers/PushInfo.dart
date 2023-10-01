import 'package:flutter/cupertino.dart';

class PushInfo with ChangeNotifier {
  static BuildContext? _context;
  static dynamic _data;

  dynamic get data => _data;

  static BuildContext?  get context => PushInfo._context;

  static void setData(dynamic data) {
    _data = data;

  }

  void checkForData() {
    if (_data != null) {
      notifyListeners();
    }
  }

  static void setContext(BuildContext c) {
    _context = c;
  }


}