// ignore_for_file: overridden_fields
library page_route_animator;

import 'package:flutter/material.dart';
import 'route_animation.dart';

class PageRouteAnimator<T> extends PageRouteBuilder<T> {
  PageRouteAnimator({
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    required this.child,
    this.currentChild,
    this.curve = Curves.linear,
    this.fullscreenDialog = false,
    this.maintainState = true,
    this.opaque = true,
    this.duration = const Duration(milliseconds: 300),
    this.reverseDuration = const Duration(milliseconds: 300),
    required this.routeAnimation,
    RouteSettings? settings,
  }) : super(
          barrierDismissible: barrierDismissible,
          barrierColor: barrierColor,
          barrierLabel: barrierLabel,
          fullscreenDialog: fullscreenDialog,
          maintainState: maintainState,
          opaque: opaque,
          transitionDuration: duration,
          settings: settings,
          reverseTransitionDuration: reverseDuration,
          pageBuilder: (context, animation, secondaryAnimation) {
            return child;
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            Widget buildSlideTransitionWithTween(
              Offset begin,
              Widget child, [
              Offset end = const Offset(0, 0),
            ]) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: begin,
                  end: end,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: curve,
                  ),
                ),
                child: child,
              );
            }

            Widget buildFadeTransitionWithAnimation(Widget child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            }

            Widget buildFadeTransitionWithTween(Widget child) {
              return FadeTransition(
                opacity: Tween<double>(
                  begin: 0,
                  end: 1,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: curve,
                  ),
                ),
                child: child,
              );
            }

            Widget buildSizeTransitionWithTween(
              Widget child,
              Alignment alignment,
            ) {
              return Align(
                alignment: alignment,
                child: SizeTransition(
                  sizeFactor: Tween<double>(
                    begin: 0,
                    end: 1,
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                  ),
                  child: child,
                ),
              );
            }

            Widget buildRotationTransitionWithAnimation(Widget child) {
              return RotationTransition(
                turns: animation,
                child: child,
              );
            }

            Widget buildRotationTransitionWithTween(Widget child) {
              return RotationTransition(
                turns: Tween<double>(
                  begin: 0,
                  end: 1,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: curve,
                  ),
                ),
                child: child,
              );
            }

            Widget buildScaleTransitionWithAnimation(Widget child) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            }

            Widget buildScaleTransitionWithTween(Widget child) {
              return ScaleTransition(
                scale: Tween<double>(
                  begin: 0,
                  end: 1,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: curve,
                  ),
                ),
                child: child,
              );
            }

            switch (routeAnimation) {
              case RouteAnimation.topToBottom:
                return buildSlideTransitionWithTween(
                  const Offset(0, -1),
                  child,
                );

              case RouteAnimation.bottomToTop:
                return buildSlideTransitionWithTween(
                  const Offset(0, 1),
                  child,
                );

              case RouteAnimation.leftToRight:
                return buildSlideTransitionWithTween(
                  const Offset(-1, 0),
                  child,
                );

              case RouteAnimation.rightToLeft:
                return buildSlideTransitionWithTween(
                  const Offset(1, 0),
                  child,
                );

              case RouteAnimation.topLeftToBottomRight:
                return buildSlideTransitionWithTween(
                  const Offset(-1, -1),
                  child,
                );

              case RouteAnimation.topRightToBottomLeft:
                return buildSlideTransitionWithTween(
                  const Offset(1, -1),
                  child,
                );

              case RouteAnimation.bottomLeftToTopRight:
                return buildSlideTransitionWithTween(
                  const Offset(-1, 1),
                  child,
                );

              case RouteAnimation.bottomRightToTopLeft:
                return buildSlideTransitionWithTween(
                  const Offset(1, 1),
                  child,
                );

              case RouteAnimation.fade:
                return buildFadeTransitionWithTween(child);

              case RouteAnimation.rotate:
                return buildRotationTransitionWithTween(child);

              case RouteAnimation.scale:
                return buildScaleTransitionWithTween(child);

              case RouteAnimation.size:
                return buildSizeTransitionWithTween(
                  child,
                  Alignment.center,
                );

              case RouteAnimation.sizeFromTop:
                return buildSizeTransitionWithTween(
                  child,
                  Alignment.topCenter,
                );

              case RouteAnimation.sizeFromBottom:
                return buildSizeTransitionWithTween(
                  child,
                  Alignment.bottomCenter,
                );

              case RouteAnimation.fadeAndRotate:
                return buildRotationTransitionWithTween(
                    buildFadeTransitionWithAnimation(child));

              case RouteAnimation.fadeAndScale:
                return buildScaleTransitionWithTween(
                  buildFadeTransitionWithAnimation(child),
                );

              case RouteAnimation.rotateAndScale:
                return buildScaleTransitionWithTween(
                  buildRotationTransitionWithAnimation(child),
                );

              case RouteAnimation.fadeRotateAndScale:
                return buildScaleTransitionWithTween(
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(child),
                  ),
                );

              case RouteAnimation.topToBottomJoined:
                assert(currentChild != null, '''

You need to add the argument: "currentChild" while using routeAnimation: "topToBottomJoined".

--Example--
child: SecondPage(),
currentChild: this (In stateless widget) OR widget (In stateful widget)


''');
                return Stack(
                  children: <Widget>[
                    buildSlideTransitionWithTween(
                      const Offset(0.0, -1.0),
                      child,
                    ),
                    buildSlideTransitionWithTween(
                      const Offset(0.0, 0.0),
                      currentChild!,
                      const Offset(0.0, 1.0),
                    ),
                  ],
                );

              case RouteAnimation.bottomToTopJoined:
                assert(currentChild != null, '''

You need to add the argument: "currentChild" while using routeAnimation: "bottomToTopJoined".

--Example--
child: SecondPage(),
currentChild: this (In stateless widget) OR widget (In stateful widget)


''');
                return Stack(
                  children: <Widget>[
                    buildSlideTransitionWithTween(
                      const Offset(0.0, 1.0),
                      child,
                    ),
                    buildSlideTransitionWithTween(
                      const Offset(0.0, 0.0),
                      currentChild!,
                      const Offset(0.0, -1.0),
                    ),
                  ],
                );

              case RouteAnimation.leftToRightJoined:
                assert(currentChild != null, '''

You need to add the argument: "currentChild" while using routeAnimation: "leftToRightJoined".

--Example--
child: SecondPage(),
currentChild: this (In stateless widget) OR widget (In stateful widget)


''');
                return Stack(
                  children: <Widget>[
                    buildSlideTransitionWithTween(
                      const Offset(-1.0, 0.0),
                      child,
                    ),
                    buildSlideTransitionWithTween(
                      const Offset(0.0, 0.0),
                      currentChild!,
                      const Offset(1.0, 0.0),
                    ),
                  ],
                );

              case RouteAnimation.rightToLeftJoined:
                assert(currentChild != null, '''

You need to add the argument: "currentChild" while using routeAnimation: "rightToLeftJoined".

--Example--
child: SecondPage(),
currentChild: this (In stateless widget) OR widget (In stateful widget)


''');
                return Stack(
                  children: <Widget>[
                    buildSlideTransitionWithTween(
                      const Offset(1.0, 0.0),
                      child,
                    ),
                    buildSlideTransitionWithTween(
                      const Offset(0.0, 0.0),
                      currentChild!,
                      const Offset(-1.0, 0.0),
                    ),
                  ],
                );

              case RouteAnimation.topToBottomWithFade:
                return buildSlideTransitionWithTween(
                  const Offset(0, -1),
                  buildFadeTransitionWithAnimation(child),
                );

              case RouteAnimation.bottomToTopWithFade:
                return buildSlideTransitionWithTween(
                  const Offset(0, 1),
                  buildFadeTransitionWithAnimation(child),
                );

              case RouteAnimation.leftToRightWithFade:
                return buildSlideTransitionWithTween(
                  const Offset(-1, 0),
                  buildFadeTransitionWithAnimation(child),
                );

              case RouteAnimation.rightToLeftWithFade:
                return buildSlideTransitionWithTween(
                  const Offset(1, 0),
                  buildFadeTransitionWithAnimation(child),
                );

              case RouteAnimation.topLeftToBottomRightWithFade:
                return buildSlideTransitionWithTween(
                  const Offset(-1, -1),
                  buildFadeTransitionWithAnimation(child),
                );

              case RouteAnimation.topRightToBottomLeftWithFade:
                return buildSlideTransitionWithTween(
                  const Offset(1, -1),
                  buildFadeTransitionWithAnimation(child),
                );

              case RouteAnimation.bottomLeftToTopRightWithFade:
                return buildSlideTransitionWithTween(
                  const Offset(-1, 1),
                  buildFadeTransitionWithAnimation(child),
                );

              case RouteAnimation.bottomRightToTopLeftWithFade:
                return buildSlideTransitionWithTween(
                  const Offset(1, 1),
                  buildFadeTransitionWithAnimation(child),
                );

              case RouteAnimation.topToBottomWithRotation:
                return buildSlideTransitionWithTween(
                  const Offset(0, -1),
                  buildRotationTransitionWithAnimation(child),
                );

              case RouteAnimation.bottomToTopWithRotation:
                return buildSlideTransitionWithTween(
                  const Offset(0, 1),
                  buildRotationTransitionWithAnimation(child),
                );

              case RouteAnimation.leftToRightWithRotation:
                return buildSlideTransitionWithTween(
                  const Offset(-1, 0),
                  buildRotationTransitionWithAnimation(child),
                );

              case RouteAnimation.rightToLeftWithRotation:
                return buildSlideTransitionWithTween(
                  const Offset(1, 0),
                  buildRotationTransitionWithAnimation(child),
                );

              case RouteAnimation.topLeftToBottomRightWithRotation:
                return buildSlideTransitionWithTween(
                  const Offset(-1, -1),
                  buildRotationTransitionWithAnimation(child),
                );

              case RouteAnimation.topRightToBottomLeftWithRotation:
                return buildSlideTransitionWithTween(
                  const Offset(1, -1),
                  buildRotationTransitionWithAnimation(child),
                );

              case RouteAnimation.bottomLeftToTopRightWithRotation:
                return buildSlideTransitionWithTween(
                  const Offset(-1, 1),
                  buildRotationTransitionWithAnimation(child),
                );

              case RouteAnimation.bottomRightToTopLeftWithRotation:
                return buildSlideTransitionWithTween(
                  const Offset(1, 1),
                  buildRotationTransitionWithAnimation(child),
                );

              case RouteAnimation.topToBottomWithFadeAndRotate:
                return buildSlideTransitionWithTween(
                  const Offset(0, -1),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(child),
                  ),
                );

              case RouteAnimation.bottomToTopWithFadeAndRotate:
                return buildSlideTransitionWithTween(
                  const Offset(0, 1),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(child),
                  ),
                );

              case RouteAnimation.leftToRightWithFadeAndRotate:
                return buildSlideTransitionWithTween(
                  const Offset(-1, 0),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(child),
                  ),
                );

              case RouteAnimation.rightToLeftWithFadeAndRotate:
                return buildSlideTransitionWithTween(
                  const Offset(1, 0),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(child),
                  ),
                );

              case RouteAnimation.topLeftToBottomRightWithFadeAndRotate:
                return buildSlideTransitionWithTween(
                  const Offset(-1, -1),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(child),
                  ),
                );

              case RouteAnimation.topRightToBottomLeftWithFadeAndRotate:
                return buildSlideTransitionWithTween(
                  const Offset(1, -1),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(child),
                  ),
                );

              case RouteAnimation.bottomLeftToTopRightWithFadeAndRotate:
                return buildSlideTransitionWithTween(
                  const Offset(-1, 1),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(child),
                  ),
                );

              case RouteAnimation.bottomRightToTopLeftWithFadeAndRotate:
                return buildSlideTransitionWithTween(
                  const Offset(1, 1),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(child),
                  ),
                );

              case RouteAnimation.topToBottomWithScale:
                return buildSlideTransitionWithTween(
                  const Offset(0, -1),
                  buildScaleTransitionWithAnimation(child),
                );

              case RouteAnimation.bottomToTopWithScale:
                return buildSlideTransitionWithTween(
                  const Offset(0, 1),
                  buildScaleTransitionWithAnimation(child),
                );

              case RouteAnimation.leftToRightWithScale:
                return buildSlideTransitionWithTween(
                  const Offset(-1, 0),
                  buildScaleTransitionWithAnimation(child),
                );

              case RouteAnimation.rightToLeftWithScale:
                return buildSlideTransitionWithTween(
                  const Offset(1, 0),
                  buildScaleTransitionWithAnimation(child),
                );

              case RouteAnimation.topLeftToBottomRightWithScale:
                return buildSlideTransitionWithTween(
                  const Offset(-1, -1),
                  buildScaleTransitionWithAnimation(child),
                );

              case RouteAnimation.topRightToBottomLeftWithScale:
                return buildSlideTransitionWithTween(
                  const Offset(1, -1),
                  buildScaleTransitionWithAnimation(child),
                );

              case RouteAnimation.bottomLeftToTopRightWithScale:
                return buildSlideTransitionWithTween(
                  const Offset(-1, 1),
                  buildScaleTransitionWithAnimation(child),
                );

              case RouteAnimation.bottomRightToTopLeftWithScale:
                return buildSlideTransitionWithTween(
                  const Offset(1, 1),
                  buildScaleTransitionWithAnimation(child),
                );

              case RouteAnimation.topToBottomWithFadeRotateAndScale:
                return buildSlideTransitionWithTween(
                  const Offset(0, -1),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(
                      buildScaleTransitionWithAnimation(child),
                    ),
                  ),
                );

              case RouteAnimation.bottomToTopWithFadeRotateAndScale:
                return buildSlideTransitionWithTween(
                  const Offset(0, 1),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(
                      buildScaleTransitionWithAnimation(child),
                    ),
                  ),
                );

              case RouteAnimation.leftToRightWithFadeRotateAndScale:
                return buildSlideTransitionWithTween(
                  const Offset(-1, 0),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(
                      buildScaleTransitionWithAnimation(child),
                    ),
                  ),
                );

              case RouteAnimation.rightToLeftWithFadeRotateAndScale:
                return buildSlideTransitionWithTween(
                  const Offset(1, 0),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(
                      buildScaleTransitionWithAnimation(child),
                    ),
                  ),
                );

              case RouteAnimation.topLeftToBottomRightWithFadeRotateAndScale:
                return buildSlideTransitionWithTween(
                  const Offset(-1, -1),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(
                      buildScaleTransitionWithAnimation(child),
                    ),
                  ),
                );

              case RouteAnimation.topRightToBottomLeftWithFadeRotateAndScale:
                return buildSlideTransitionWithTween(
                  const Offset(1, -1),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(
                      buildScaleTransitionWithAnimation(child),
                    ),
                  ),
                );

              case RouteAnimation.bottomLeftToTopRightWithFadeRotateAndScale:
                return buildSlideTransitionWithTween(
                  const Offset(-1, 1),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(
                      buildScaleTransitionWithAnimation(child),
                    ),
                  ),
                );

              case RouteAnimation.bottomRightToTopLeftWithFadeRotateAndScale:
                return buildSlideTransitionWithTween(
                  const Offset(1, 1),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(
                      buildScaleTransitionWithAnimation(child),
                    ),
                  ),
                );
            }
          },
        );

  @override
  final Color? barrierColor;

  @override
  final bool barrierDismissible;

  @override
  final String? barrierLabel;

  final Widget child;

  final Widget? currentChild;

  final Curve curve;

  @override
  final bool fullscreenDialog;

  @override
  final bool maintainState;

  @override
  final bool opaque;

  final Duration duration;

  final Duration reverseDuration;

  final RouteAnimation routeAnimation;
}
