import 'package:flutter/cupertino.dart';
import 'package:hackaton/widgets/register.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Register"),
        ),
        child: Register()
    );
  }
}
