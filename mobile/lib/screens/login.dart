import 'package:flutter/cupertino.dart';
import 'package:hackaton/providers/PushInfo.dart';
import 'package:hackaton/widgets/login.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});



  @override
  Widget build(BuildContext context) {
    PushInfo.setContext(context);
    return const CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Welcome"),
        ),
        child: Login()
    );
  }
}
