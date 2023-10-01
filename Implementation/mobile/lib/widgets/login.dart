import 'package:flutter/cupertino.dart';
import 'package:hackaton/providers/login.dart';
import 'package:hackaton/providers/register.dart';
import 'package:hackaton/utils/http/http.dart';
import 'package:hackaton/utils/showDialog.dart';
import 'package:hackaton/widgets/OrSeparator.dart';
import 'package:hackaton/widgets/dialog.dart';
import 'package:hackaton/widgets/input.dart';
import 'package:hackaton/widgets/lottieButton.dart';
import 'package:hackaton/widgets/socials.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Login extends StatelessWidget {
  const Login({super.key});




  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        //height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 120,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset("assets/logo.png", width: 250,)
            ),
            SizedBox(
              height: 50,
            ),
            CustomInput(
              hint: "Email",
              width: 300,
              obscure: false,
              onChange: (String value) {
                context.read<UserLogin>().setUsername(value);

              },
            ),
            SizedBox(
              height: 40,
            ),
            CustomInput(
              hint: "Password",
              width: 300,
              obscure: true,
              onChange: (String value) {
                context.read<UserLogin>().setPassword(value);

              },
            ),
            SizedBox(
              height: 40,
            ),

            SizedBox(
              width: 300,
              child: CupertinoButton.filled(
                  child: const Text("Log In") ,
                  onPressed: () async{
                    context.read<UserLogin>().setFcmToken((await FirebaseMessaging.instance.getToken())!);
                    print(context.read<UserLogin>().userLogin.toJson());
                    var res = await LoginRequest(context.read<UserLogin>().userLogin.toJson());
                    if (context.mounted) {
                      if (res.statusCode == 200) {
                        ShowDialog.showAlertDialog(context, CustomDialog(title: "Message", content: "Login Successful",
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed("home");
                          },
                        ));

                        return;
                      }
                      ShowDialog.showAlertDialog(context, CustomDialog(
                          title: "Warning",
                          content: "Wrong username or password",
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                      )
                      );
                    }
                  }
              ),
            ),
            SizedBox(
              height: 30,
            ),
            OrSeparator(),
            SizedBox(
              height: 30,
            ),
            Socials(),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Don't have an account?", style: TextStyle(fontSize: 14.3),),
                  CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: const Text("create a new account", style: TextStyle(fontSize: 14.3)),
                      onPressed: () async {
                        await Navigator.of(context).pushNamed("register");
                        context.read<UserRegister>().clear();
                        context.read<UserRegister>().validateCoor();
                      }
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
