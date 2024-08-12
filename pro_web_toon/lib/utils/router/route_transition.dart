import 'package:flutter/material.dart';

//Kullanimda Degil
class RouteTransition {
  RouteTransition._();

  static PageRouteBuilder customTransitionBuilder({
    required Widget child,
    Object? arguments,
  }) {
    return PageRouteBuilder(
      settings: RouteSettings(arguments: arguments),
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionDuration: const Duration(milliseconds: 250),
      reverseTransitionDuration: const Duration(milliseconds: 250),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return slideTransitionBuilder(
          animation: animation,
          child: child,
        );
      },
    );
  }

  static FadeTransition fadeTransitionBuilder({
    required Widget child,
    required Animation<double> animation,
  }) {
    final opacity = animation.drive(Tween<double>(begin: 0, end: 1));

    return FadeTransition(opacity: opacity, child: child);
  }

  static RotationTransition rotationTransitionBuilder({
    required Widget child,
    required Animation<double> animation,
  }) {
    final rotation = animation.drive(Tween<double>(begin: 0, end: 1));

    return RotationTransition(turns: rotation, child: child);
  }

  static ScaleTransition scaleTransitionBuilder({
    required Widget child,
    required Animation<double> animation,
  }) {
    final scale = animation.drive(Tween<double>(begin: 0, end: 1));

    return ScaleTransition(scale: scale, child: child);
  }

  static ScaleTransition scaleRotationTransitionBuilder({
    required Widget child,
    required Animation<double> animation,
  }) {
    final scale = animation.drive(Tween<double>(begin: 0, end: 1));

    return ScaleTransition(
      scale: scale,
      child: RotationTransition(
        turns: scale,
        child: child,
      ),
    );
  }

  static SlideTransition slideTransitionBuilder({
    required Widget child,
    required Animation<double> animation,
  }) {
    final position = animation.drive(
      Tween<Offset>(
        begin: const Offset(1, 0),
        end: const Offset(0, 0),
      ),
    );

    return SlideTransition(position: position, child: child);

    // left to right: begin: Offset(-1,0) end: Offset(0,0)
    // right to left: begin: Offset(1,0) end: Offset(0,0)
    // bottom to top: begin: Offset(0,1) end: Offset(0,0)
    // top to bottmo: begin: Offset(0,-1) end: Offset(0,0)
    // from top right corner: begin: Offset(1,-1) end: Offset(0,0)
    // from bottom right corner: begin: Offset(1,1) end: Offset(0,0)
    // from top left corner: begin: Offset(-1,-1) end: Offset(0,0)
    // from bottom left corner: begin: Offset(-1,1) end: Offset(0,0)
  }
}
