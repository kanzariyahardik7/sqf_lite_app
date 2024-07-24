import 'package:flutter/material.dart';

class RoutAnimation {
  Route normalPageAnimation(pagename) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => pagename,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          final offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        });
  }
}