import 'package:flutter/cupertino.dart';


class CustomInput extends StatelessWidget {

  final String hint;
  final double width;
  final bool obscure;
  final Function(String) onChange;
  const CustomInput({super.key, required this.hint, required this.width, required this.obscure, required this.onChange});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: width,
      height: 50,
      child: CupertinoTextField(
        obscureText: obscure,
        onChanged: onChange,


        cursorColor: CupertinoColors.activeBlue,
        placeholder: hint,

        decoration: BoxDecoration(
          //color: CupertinoColors.systemGrey,



         borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: CupertinoColors.systemBlue
          )

        ),
      ),
    );
  }
}
