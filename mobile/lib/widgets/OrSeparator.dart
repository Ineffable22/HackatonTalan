import 'package:flutter/cupertino.dart';

class OrSeparator extends StatelessWidget {
  const OrSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 300,
      child: Opacity(
        opacity: 0.5,
        child: Row(
          children: [
            SizedBox(
              width: 132,
              height: 1,
              child: DecoratedBox(
                decoration:  BoxDecoration(
                    color: CupertinoColors.systemGrey
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text("or"),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 132,
              height: 1,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
