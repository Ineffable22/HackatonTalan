import 'package:flutter/cupertino.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final Function() onPressed;
  const CustomDialog({super.key, required this.title, required this.content, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          /// This parameter indicates the action would perform
          /// a destructive action such as deletion, and turns
          /// the action's text color to red.
          isDestructiveAction: true,
          onPressed: onPressed,
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
