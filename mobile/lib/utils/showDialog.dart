import 'package:flutter/cupertino.dart';

class ShowDialog {
  static void showAlertDialog(BuildContext context, Widget widget) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => widget
    );
  }
}