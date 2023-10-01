import 'package:flutter/cupertino.dart';
import 'package:hackaton/providers/register.dart';
import 'package:provider/provider.dart';

class LocationInput extends StatelessWidget {
  final Function() onPressed;
  const LocationInput({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Your location"),
            Opacity(
              opacity: 0.5,
              child: Icon(
                CupertinoIcons.placemark_fill,
                color: !context.watch<UserRegister>().validCoor ? CupertinoColors.destructiveRed: CupertinoColors.activeBlue,
              ),
            )
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
