// ignore_for_file: overridden_fields
library page_route_animator;

import 'package:flutter/material.dart';
import 'route_animation.dart';

/// PageRouteAnimator for page route transition
class PageRouteAnimator<T> extends PageRouteBuilder<T> {
  /// Creates an animated route, pass next screen as child.
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
            /// build slide transition with tween
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

            /// build fade transition with animation
            Widget buildFadeTransitionWithAnimation(Widget child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            }

            /// build fade transition with tween
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

            /// build size transition with tween
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

            /// build fade transition with animation
            Widget buildRotationTransitionWithAnimation(Widget child) {
              return RotationTransition(
                turns: animation,
                child: child,
              );
            }

            /// build rotation transition with tween
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

            /// build scale transition with animation
            Widget buildScaleTransitionWithAnimation(Widget child) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            }

            /// build scale transition with tween
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

              /// [RouteAnimation.topToBottom] : Slide animation from top to bottom
              case RouteAnimation.topToBottom:
                return buildSlideTransitionWithTween(
                  const Offset(0, -1),
                  child,
                );

              /// [RouteAnimation.bottomToTop] : Slide animation form bottom to top
              case RouteAnimation.bottomToTop:
                return buildSlideTransitionWithTween(
                  const Offset(0, 1),
                  child,
                );

              /// [RouteAnimation.leftToRight] : Slide animation from left to right
              case RouteAnimation.leftToRight:
                return buildSlideTransitionWithTween(
                  const Offset(-1, 0),
                  child,
                );

              /// [RouteAnimation.rightToLeft] : Slide animation form right to left
              case RouteAnimation.rightToLeft:
                return buildSlideTransitionWithTween(
                  const Offset(1, 0),
                  child,
                );

              /// [RouteAnimation.topLeftToBottomRight] : Slide animation form topLeft to bottomRight
              case RouteAnimation.topLeftToBottomRight:
                return buildSlideTransitionWithTween(
                  const Offset(-1, -1),
                  child,
                );

              /// [RouteAnimation.topRightToBottomLeft] : Slide animation from topRight to bottomLeft
              case RouteAnimation.topRightToBottomLeft:
                return buildSlideTransitionWithTween(
                  const Offset(1, -1),
                  child,
                );

              /// [RouteAnimation.bottomLeftToTopRight] : Slide animation form bottomLeft to topRight
              case RouteAnimation.bottomLeftToTopRight:
                return buildSlideTransitionWithTween(
                  const Offset(-1, 1),
                  child,
                );

              /// [RouteAnimation.bottomRightToTopLeft] : Slide animation form bottomRight to topLeft
              case RouteAnimation.bottomRightToTopLeft:
                return buildSlideTransitionWithTween(
                  const Offset(1, 1),
                  child,
                );

              /// [RouteAnimation.fade] : Fade animation
              case RouteAnimation.fade:
                return buildFadeTransitionWithTween(child);

              /// [RouteAnimation.rotate] : Rotate animation
              case RouteAnimation.rotate:
                return buildRotationTransitionWithTween(child);

              /// [RouteAnimation.scale] : Scale animation
              case RouteAnimation.scale:
                return buildScaleTransitionWithTween(child);

              /// [RouteAnimation.size] : Size animation form center
              case RouteAnimation.size:
                return buildSizeTransitionWithTween(
                  child,
                  Alignment.center,
                );

              /// [RouteAnimation.sizeFromTop] : Size animation form top
              case RouteAnimation.sizeFromTop:
                return buildSizeTransitionWithTween(
                  child,
                  Alignment.topCenter,
                );

              /// [RouteAnimation.sizeFromBottom] : Size animation form bottom
              case RouteAnimation.sizeFromBottom:
                return buildSizeTransitionWithTween(
                  child,
                  Alignment.bottomCenter,
                );

              /// [RouteAnimation.fadeAndRotate] : Fade and rotate animation
              case RouteAnimation.fadeAndRotate:
                return buildRotationTransitionWithTween(
                    buildFadeTransitionWithAnimation(child));

              /// [RouteAnimation.fadeAndScale] : Fade and scale animation
              case RouteAnimation.fadeAndScale:
                return buildScaleTransitionWithTween(
                  buildFadeTransitionWithAnimation(child),
                );

              /// [RouteAnimation.rotateAndScale] : Rotate and scale animation
              case RouteAnimation.rotateAndScale:
                return buildScaleTransitionWithTween(
                  buildRotationTransitionWithAnimation(child),
                );

              /// [RouteAnimation.fadeRotateAndScale] : Fade, rotate and scale animation
              case RouteAnimation.fadeRotateAndScale:
                return buildScaleTransitionWithTween(
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(child),
                  ),
                );

              /// [RouteAnimation.topToBottomJoined] : Slide animation form top to bottom as joined
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

              /// [RouteAnimation.bottomToTopJoined] : Slide animation form bottom to top as joined
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

              /// [RouteAnimation.leftToRightJoined] : Slide animation form left to right as joined
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

              /// [RouteAnimation.rightToLeftJoined] : Slide animation from right to left as joined
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

              /// [RouteAnimation.topToBottomWithFade] : Slide animation form top to bottom with fading
              case RouteAnimation.topToBottomWithFade:
                return buildSlideTransitionWithTween(
                  const Offset(0, -1),
                  buildFadeTransitionWithAnimation(child),
                );

              /// [RouteAnimation.bottomToTopWithFade] : Slide animation from bottom to top with fading
              case RouteAnimation.bottomToTopWithFade:
                return buildSlideTransitionWithTween(
                  const Offset(0, 1),
                  buildFadeTransitionWithAnimation(child),
                );

              /// [RouteAnimation.leftToRightWithFade] : Slide animation from left to right with fading
              case RouteAnimation.leftToRightWithFade:
                return buildSlideTransitionWithTween(
                  const Offset(-1, 0),
                  buildFadeTransitionWithAnimation(child),
                );

              /// [RouteAnimation.rightToLeftWithFade] : Slide animation from right to left with fading
              case RouteAnimation.rightToLeftWithFade:
                return buildSlideTransitionWithTween(
                  const Offset(1, 0),
                  buildFadeTransitionWithAnimation(child),
                );

              /// [RouteAnimation.topLeftToBottomRightWithFade] : Slide animation from topLeft to bottomRight with fading
              case RouteAnimation.topLeftToBottomRightWithFade:
                return buildSlideTransitionWithTween(
                  const Offset(-1, -1),
                  buildFadeTransitionWithAnimation(child),
                );

              /// [RouteAnimation.topRightToBottomLeftWithFade] : Slide animation from topRight to bottomLeft with fading
              case RouteAnimation.topRightToBottomLeftWithFade:
                return buildSlideTransitionWithTween(
                  const Offset(1, -1),
                  buildFadeTransitionWithAnimation(child),
                );

              /// [RouteAnimation.bottomLeftToTopRightWithFade] : Slide animation from bottomLeft to topRight with fading
              case RouteAnimation.bottomLeftToTopRightWithFade:
                return buildSlideTransitionWithTween(
                  const Offset(-1, 1),
                  buildFadeTransitionWithAnimation(child),
                );

              /// [RouteAnimation.bottomRightToTopLeftWithFade] : Slide animation from bottomRight to topLeft with fading
              case RouteAnimation.bottomRightToTopLeftWithFade:
                return buildSlideTransitionWithTween(
                  const Offset(1, 1),
                  buildFadeTransitionWithAnimation(child),
                );

              /// [RouteAnimation.topToBottomWithRotation] : Slide animation from top to bottom with rotation
              case RouteAnimation.topToBottomWithRotation:
                return buildSlideTransitionWithTween(
                  const Offset(0, -1),
                  buildRotationTransitionWithAnimation(child),
                );

              /// [RouteAnimation.bottomToTopWithRotation] : Slide animation from bottom to top with rotation
              case RouteAnimation.bottomToTopWithRotation:
                return buildSlideTransitionWithTween(
                  const Offset(0, 1),
                  buildRotationTransitionWithAnimation(child),
                );

              /// [RouteAnimation.leftToRightWithRotation] : Slide animation from left to right with rotation
              case RouteAnimation.leftToRightWithRotation:
                return buildSlideTransitionWithTween(
                  const Offset(-1, 0),
                  buildRotationTransitionWithAnimation(child),
                );

              /// [RouteAnimation.rightToLeftWithRotation] : Slide animation from right to left with rotation
              case RouteAnimation.rightToLeftWithRotation:
                return buildSlideTransitionWithTween(
                  const Offset(1, 0),
                  buildRotationTransitionWithAnimation(child),
                );

              /// [RouteAnimation.topLeftToBottomRightWithRotation] : Slide animation from topLeft to bottomRight with rotation
              case RouteAnimation.topLeftToBottomRightWithRotation:
                return buildSlideTransitionWithTween(
                  const Offset(-1, -1),
                  buildRotationTransitionWithAnimation(child),
                );

              /// [RouteAnimation.topRightToBottomLeftWithRotation] : Slide animation from topRight to bottomLeft with rotation
              case RouteAnimation.topRightToBottomLeftWithRotation:
                return buildSlideTransitionWithTween(
                  const Offset(1, -1),
                  buildRotationTransitionWithAnimation(child),
                );

              /// [RouteAnimation.bottomLeftToTopRightWithRotation] : Slide animation from bottomLeft to topRight with rotation
              case RouteAnimation.bottomLeftToTopRightWithRotation:
                return buildSlideTransitionWithTween(
                  const Offset(-1, 1),
                  buildRotationTransitionWithAnimation(child),
                );

              /// [RouteAnimation.bottomRightToTopLeftWithRotation] : Slide animation from bottomRight to topLeft with rotation
              case RouteAnimation.bottomRightToTopLeftWithRotation:
                return buildSlideTransitionWithTween(
                  const Offset(1, 1),
                  buildRotationTransitionWithAnimation(child),
                );

              /// [RouteAnimation.topToBottomWithFadeAndRotate] : Slide animation from top to bottom with fade and rotate animation
              case RouteAnimation.topToBottomWithFadeAndRotate:
                return buildSlideTransitionWithTween(
                  const Offset(0, -1),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(child),
                  ),
                );

              /// [RouteAnimation.bottomToTopWithFadeAndRotate] : Slide animation from bottom to top with fade and rotate animation
              case RouteAnimation.bottomToTopWithFadeAndRotate:
                return buildSlideTransitionWithTween(
                  const Offset(0, 1),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(child),
                  ),
                );

              /// [RouteAnimation.leftToRightWithFadeAndRotate] : Slide animation from left to right with fade and rotate animation
              case RouteAnimation.leftToRightWithFadeAndRotate:
                return buildSlideTransitionWithTween(
                  const Offset(-1, 0),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(child),
                  ),
                );

              /// [RouteAnimation.rightToLeftWithFadeAndRotate] : Slide animation from right to left with fade and rotate animation
              case RouteAnimation.rightToLeftWithFadeAndRotate:
                return buildSlideTransitionWithTween(
                  const Offset(1, 0),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(child),
                  ),
                );

              /// [RouteAnimation.topLeftToBottomRightWithFadeAndRotate] : Slide animation from topLeft to bottomRight with fade and rotate animation
              case RouteAnimation.topLeftToBottomRightWithFadeAndRotate:
                return buildSlideTransitionWithTween(
                  const Offset(-1, -1),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(child),
                  ),
                );

              /// [RouteAnimation.topRightToBottomLeftWithFadeAndRotate] : Slide animation from topRight to bottomLeft with fade and rotate animation
              case RouteAnimation.topRightToBottomLeftWithFadeAndRotate:
                return buildSlideTransitionWithTween(
                  const Offset(1, -1),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(child),
                  ),
                );

              /// [RouteAnimation.bottomLeftToTopRightWithFadeAndRotate] : Slide animation from bottomLeft to topRight with fade and rotate animation
              case RouteAnimation.bottomLeftToTopRightWithFadeAndRotate:
                return buildSlideTransitionWithTween(
                  const Offset(-1, 1),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(child),
                  ),
                );

              /// [RouteAnimation.bottomRightToTopLeftWithFadeAndRotate] : Slide animation from bottomRight to topLeft with fade and rotate animation
              case RouteAnimation.bottomRightToTopLeftWithFadeAndRotate:
                return buildSlideTransitionWithTween(
                  const Offset(1, 1),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(child),
                  ),
                );

              /// [RouteAnimation.topToBottomWithScale] : Slide animation from top to bottom with scaling
              case RouteAnimation.topToBottomWithScale:
                return buildSlideTransitionWithTween(
                  const Offset(0, -1),
                  buildScaleTransitionWithAnimation(child),
                );

              /// [RouteAnimation.bottomToTopWithScale] : Slide animation from bottom to top with scaling
              case RouteAnimation.bottomToTopWithScale:
                return buildSlideTransitionWithTween(
                  const Offset(0, 1),
                  buildScaleTransitionWithAnimation(child),
                );

              /// [RouteAnimation.leftToRightWithScale] : Slide animation from left to right with scaling
              case RouteAnimation.leftToRightWithScale:
                return buildSlideTransitionWithTween(
                  const Offset(-1, 0),
                  buildScaleTransitionWithAnimation(child),
                );

              /// [RouteAnimation.rightToLeftWithScale] : Slide animation from right to left with scaling
              case RouteAnimation.rightToLeftWithScale:
                return buildSlideTransitionWithTween(
                  const Offset(1, 0),
                  buildScaleTransitionWithAnimation(child),
                );

              /// [RouteAnimation.topLeftToBottomRightWithScale] : Slide animation from topLeft to bottomRight with scaling
              case RouteAnimation.topLeftToBottomRightWithScale:
                return buildSlideTransitionWithTween(
                  const Offset(-1, -1),
                  buildScaleTransitionWithAnimation(child),
                );

              /// [RouteAnimation.topRightToBottomLeftWithScale] : Slide animation from topRight to bottomLeft with scaling
              case RouteAnimation.topRightToBottomLeftWithScale:
                return buildSlideTransitionWithTween(
                  const Offset(1, -1),
                  buildScaleTransitionWithAnimation(child),
                );

              /// [RouteAnimation.bottomLeftToTopRightWithScale] : Slide animation from bottomLeft to topRight with scaling
              case RouteAnimation.bottomLeftToTopRightWithScale:
                return buildSlideTransitionWithTween(
                  const Offset(-1, 1),
                  buildScaleTransitionWithAnimation(child),
                );

              /// [RouteAnimation.bottomRightToTopLeftWithScale] : Slide animation from bottomRight to topLeft with scaling
              case RouteAnimation.bottomRightToTopLeftWithScale:
                return buildSlideTransitionWithTween(
                  const Offset(1, 1),
                  buildScaleTransitionWithAnimation(child),
                );

              /// [RouteAnimation.topToBottomWithFadeRotateAndScale] : Slide animation from top to bottom with fade, rotate and scale animation
              case RouteAnimation.topToBottomWithFadeRotateAndScale:
                return buildSlideTransitionWithTween(
                  const Offset(0, -1),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(
                      buildScaleTransitionWithAnimation(child),
                    ),
                  ),
                );

              /// [RouteAnimation.bottomToTopWithFadeRotateAndScale] : Slide animation from bottom to top with fade, rotate and scale animation
              case RouteAnimation.bottomToTopWithFadeRotateAndScale:
                return buildSlideTransitionWithTween(
                  const Offset(0, 1),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(
                      buildScaleTransitionWithAnimation(child),
                    ),
                  ),
                );

              /// [RouteAnimation.leftToRightWithFadeRotateAndScale] : Slide animation from left to right with fade, rotate and scale animation
              case RouteAnimation.leftToRightWithFadeRotateAndScale:
                return buildSlideTransitionWithTween(
                  const Offset(-1, 0),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(
                      buildScaleTransitionWithAnimation(child),
                    ),
                  ),
                );

              /// [RouteAnimation.rightToLeftWithFadeRotateAndScale] : Slide animation from right to left with fade, rotate and scale animation
              case RouteAnimation.rightToLeftWithFadeRotateAndScale:
                return buildSlideTransitionWithTween(
                  const Offset(1, 0),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(
                      buildScaleTransitionWithAnimation(child),
                    ),
                  ),
                );

              /// [RouteAnimation.topLeftToBottomRightWithFadeRotateAndScale] : Slide animation from topLeft to bottomRight with fade, rotate and scale animation
              case RouteAnimation.topLeftToBottomRightWithFadeRotateAndScale:
                return buildSlideTransitionWithTween(
                  const Offset(-1, -1),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(
                      buildScaleTransitionWithAnimation(child),
                    ),
                  ),
                );

              /// [RouteAnimation.topRightToBottomLeftWithFadeRotateAndScale] : Slide animation from topRight to bottomLeft with fade, rotate and scale animation
              case RouteAnimation.topRightToBottomLeftWithFadeRotateAndScale:
                return buildSlideTransitionWithTween(
                  const Offset(1, -1),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(
                      buildScaleTransitionWithAnimation(child),
                    ),
                  ),
                );

              /// [RouteAnimation.bottomLeftToTopRightWithFadeRotateAndScale] : Slide animation from bottomLeft to topRight with fade, rotate and scale animation
              case RouteAnimation.bottomLeftToTopRightWithFadeRotateAndScale:
                return buildSlideTransitionWithTween(
                  const Offset(-1, 1),
                  buildRotationTransitionWithAnimation(
                    buildFadeTransitionWithAnimation(
                      buildScaleTransitionWithAnimation(child),
                    ),
                  ),
                );

              /// [RouteAnimation.bottomRightToTopLeftWithFadeRotateAndScale] : Slide animation from bottomRight to topLeft with fade, rotate and scale animation
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

  /// The color to use for the modal barrier. If this is null, the barrier will be transparent.
  @override
  final Color? barrierColor;

  /// Whether you can dismiss this route by tapping the modal barrier.
  @override
  final bool barrierDismissible;

  /// The semantic label used for a dismissible barrier.
  @override
  final String? barrierLabel;

  /// The widget/screen where you want to navigate.
  final Widget child;

  /// Your current widget/screen.
  final Widget? currentChild;

  /// Curve for navigation animation.
  final Curve curve;

  /// Whether this page route is a full-screen dialog.
  @override
  final bool fullscreenDialog;

  /// Whether the route should remain in memory when it is inactive.
  @override
  final bool maintainState;

  /// Whether the route obscures previous routes when the transition is complete.
  @override
  final bool opaque;

  /// Duration for navigation animation, default is 300 ms.
  final Duration duration;

  /// Duration for navigation animation while pop, default is 300 ms.
  final Duration reverseDuration;

  /// The route animation which you want to use for navigation.
  /// There are 62 different animation which you can use.
  final RouteAnimation routeAnimation;
}
