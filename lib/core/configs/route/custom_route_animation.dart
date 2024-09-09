import 'package:flutter/material.dart';

class CustomRouteAnimation extends PageRouteBuilder {
  final Widget child;

  CustomRouteAnimation({required this.child})
      : super(
            reverseTransitionDuration: const Duration(milliseconds: 250),
            transitionDuration: const Duration(milliseconds: 250),
            pageBuilder: (context, animation, secondaryAnimation) => child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      FadeTransition(opacity: animation, child: child);
}
