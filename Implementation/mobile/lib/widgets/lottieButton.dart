import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class LottieButton extends StatelessWidget {
  final LottieBuilder lottie;
  const LottieButton({super.key, required this.lottie});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: (){},
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: CupertinoColors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: CupertinoColors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 1),
                )
              ]
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.black.withOpacity(0.1),
                    spreadRadius: 0.1,
                    blurRadius: 0.1,
                    offset: Offset(0, 1),
                  )
                ]
            ),
            child: Padding(
              padding: EdgeInsets.all(3),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: lottie
              ),

            ),
          ),
        ),
      ),
    );
  }
}
