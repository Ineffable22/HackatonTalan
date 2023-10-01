import 'package:flutter/cupertino.dart';
import 'package:hackaton/widgets/lottieButton.dart';
import 'package:lottie/lottie.dart';

class Socials extends StatelessWidget {
  const Socials({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 55,
            child: LottieButton(lottie: Lottie.asset('assets/gmail.json')),

          ),
          SizedBox(
            width: 55,
            child: LottieButton(lottie: Lottie.asset('assets/facebook2.json')),

          ),
          SizedBox(
            width: 55,
            child: LottieButton(lottie: Lottie.asset('assets/twitter.json')),

          )
        ],
      ),
    );
  }
}
