import 'package:flutter/cupertino.dart';
import 'package:hackaton/providers/register.dart';
import 'package:hackaton/utils/http/http.dart';
import 'package:hackaton/utils/showDialog.dart';
import 'package:hackaton/widgets/OrSeparator.dart';
import 'package:hackaton/widgets/dialog.dart';
import 'package:hackaton/widgets/input.dart';
import 'package:hackaton/widgets/locationInput.dart';
import 'package:hackaton/widgets/socials.dart';
import 'package:provider/provider.dart';

class Register extends StatelessWidget {
  const Register({super.key});

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
              height: 90,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset("assets/logo.png", width: 180,)
            ),
            SizedBox(
              height: 20,
            ),
            CustomInput(
              hint: "Full Name",
              width: 300,
              obscure: false,
              onChange: (String value) {
                context.read<UserRegister>().setName(value);

              },
            ),
            SizedBox(
              height: 40,
            ),
            CustomInput(
              hint: "Email",
              width: 300,
              obscure: false,
              onChange: (String value) {
                context.read<UserRegister>().setUsername(value);

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
                context.read<UserRegister>().setPassword(value);

              },
            ),
            SizedBox(
              height: 40,
            ),
            CustomInput(
              hint: "Repeat Password",
              width: 300,
              obscure: true,
              onChange: (String value) {
                context.read<UserRegister>().setRepeatPassword(value);

              },
            ),
            SizedBox(
              height: 20,
            ),
            LocationInput(
              onPressed: () async{
                await Navigator.of(context).pushNamed("register-map");
                context.read<UserRegister>().validateCoor();
              },
            ),
            SizedBox(
              height: 20,
            ),

            SizedBox(
              width: 300,
              child: CupertinoButton.filled(
                  child: const Text("Register") ,
                  onPressed: () async{
                    var res = await RegisterRequest(context.read<UserRegister>().userRegister.toJson());
                    if (context.mounted) {
                      if (res.statusCode == 200) {
                        ShowDialog.showAlertDialog(context, CustomDialog(title: "Message", content: "Account created",
                          onPressed: () {
                            Navigator.of(context).popUntil((route) => route.isFirst);
                          },
                        ));
                        return;
                      }
                      ShowDialog.showAlertDialog(context, CustomDialog(title: "Alert", content: "An error has ocurred",
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ));
                      context.read<UserRegister>().clear();
                      context.read<UserRegister>().validateCoor();
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
          ],
        ),
      ),
    );;
  }
}
