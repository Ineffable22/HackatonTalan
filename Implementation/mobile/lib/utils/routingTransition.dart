

import 'package:flutter/cupertino.dart';

class RoutesTransition {
  static Route createRoute(Widget next, {double a = 1.0, double b = -1.0}) {
    return
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => next,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          Offset begin = Offset(a, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
              position: animation.drive(tween),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset.zero,
                  end: Offset(b, 0.0),
                ).chain(CurveTween(curve: curve)).animate(secondaryAnimation),
                child: child,
              )
          );
        },
      );
  }
}