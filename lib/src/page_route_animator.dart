// ignore_for_file: overridden_fields
library page_route_animator;

import 'route_animation.dart';
import 'package:flutter/material.dart';

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
            Widget getSlideFadeAndRotateAnimation(Offset begin, Widget child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: begin,
                  end: const Offset(0, 0),
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: curve,
                  ),
                ),
                child: RotationTransition(
                  turns: animation,
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                ),
              );
            }

            Widget getSlideAndScaleAnimation(Offset begin, Widget child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: begin,
                  end: const Offset(0, 0),
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: curve,
                  ),
                ),
                child: ScaleTransition(
                  scale: animation,
                  child: child,
                ),
              );
            }

            Widget getSlideFadeRotateAndScaleAnimation(
                Offset begin, Widget child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: begin,
                  end: const Offset(0, 0),
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: curve,
                  ),
                ),
                child: RotationTransition(
                  turns: animation,
                  child: FadeTransition(
                    opacity: animation,
                    child: ScaleTransition(
                      scale: animation,
                      child: child,
                    ),
                  ),
                ),
              );
            }

            switch (routeAnimation) {
              case RouteAnimation.topToBottom:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, -1),
                    end: const Offset(0, 0),
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                  ),
                  child: child,
                );
              case RouteAnimation.bottomToTop:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: const Offset(0, 0),
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                  ),
                  child: child,
                );
              case RouteAnimation.leftToRight:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1, 0),
                    end: const Offset(0, 0),
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                  ),
                  child: child,
                );
              case RouteAnimation.rightToLeft:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: const Offset(0, 0),
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                  ),
                  child: child,
                );
              case RouteAnimation.topLeftToBottomRight:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1, -1),
                    end: const Offset(0, 0),
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                  ),
                  child: child,
                );
              case RouteAnimation.topRightToBottomLeft:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, -1),
                    end: const Offset(0, 0),
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                  ),
                  child: child,
                );
              case RouteAnimation.bottomLeftToTopRight:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1, 1),
                    end: const Offset(0, 0),
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                  ),
                  child: child,
                );
              case RouteAnimation.bottomRightToTopLeft:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 1),
                    end: const Offset(0, 0),
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                  ),
                  child: child,
                );
              case RouteAnimation.fade:
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

              case RouteAnimation.size:
                return Align(
                  alignment: Alignment.center,
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
              case RouteAnimation.sizeFromTop:
                return Align(
                  alignment: Alignment.topCenter,
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
              case RouteAnimation.sizeFromBottom:
                return Align(
                  alignment: Alignment.bottomCenter,
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

              case RouteAnimation.fadeAndRotate:
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
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              case RouteAnimation.fadeAndScale:
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
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              case RouteAnimation.rotateAndScale:
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
                  child: RotationTransition(
                    turns: animation,
                    child: child,
                  ),
                );
              case RouteAnimation.fadeRotateAndScale:
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
                  child: RotationTransition(
                    turns: animation,
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
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
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.0, -1.0),
                        end: const Offset(0.0, 0.0),
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: curve,
                        ),
                      ),
                      child: child,
                    ),
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.0, 0.0),
                        end: const Offset(0.0, 1.0),
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: curve,
                        ),
                      ),
                      child: currentChild,
                    )
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
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.0, 1.0),
                        end: const Offset(0.0, 0.0),
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: curve,
                        ),
                      ),
                      child: child,
                    ),
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.0, 0.0),
                        end: const Offset(0.0, -1.0),
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: curve,
                        ),
                      ),
                      child: currentChild,
                    )
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
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(-1.0, 0.0),
                        end: const Offset(0.0, 0.0),
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: curve,
                        ),
                      ),
                      child: child,
                    ),
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.0, 0.0),
                        end: const Offset(1.0, 0.0),
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: curve,
                        ),
                      ),
                      child: currentChild,
                    )
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
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0),
                        end: const Offset(0.0, 0.0),
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: curve,
                        ),
                      ),
                      child: child,
                    ),
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.0, 0.0),
                        end: const Offset(-1.0, 0.0),
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: curve,
                        ),
                      ),
                      child: currentChild,
                    )
                  ],
                );

              case RouteAnimation.topToBottomWithFade:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, -1),
                    end: const Offset(0, 0),
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                  ),
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              case RouteAnimation.bottomToTopWithFade:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: const Offset(0, 0),
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                  ),
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              case RouteAnimation.leftToRightWithFade:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1, 0),
                    end: const Offset(0, 0),
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                  ),
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              case RouteAnimation.rightToLeftWithFade:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: const Offset(0, 0),
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                  ),
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              case RouteAnimation.topLeftToBottomRightWithFade:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1, -1),
                    end: const Offset(0, 0),
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                  ),
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              case RouteAnimation.topRightToBottomLeftWithFade:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, -1),
                    end: const Offset(0, 0),
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                  ),
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              case RouteAnimation.bottomLeftToTopRightWithFade:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1, 1),
                    end: const Offset(0, 0),
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                  ),
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              case RouteAnimation.bottomRightToTopLeftWithFade:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 1),
                    end: const Offset(0, 0),
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                  ),
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              case RouteAnimation.rotate:
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
              case RouteAnimation.topToBottomWithRotation:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, -1),
                    end: const Offset(0, 0),
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                  ),
                  child: RotationTransition(
                    turns: animation,
                    child: child,
                  ),
                );
              case RouteAnimation.bottomToTopWithRotation:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: const Offset(0, 0),
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                  ),
                  child: RotationTransition(
                    turns: animation,
                    child: child,
                  ),
                );
              case RouteAnimation.leftToRightWithRotation:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1, 0),
                    end: const Offset(0, 0),
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                  ),
                  child: RotationTransition(
                    turns: animation,
                    child: child,
                  ),
                );
              case RouteAnimation.rightToLeftWithRotation:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: const Offset(0, 0),
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                  ),
                  child: RotationTransition(
                    turns: animation,
                    child: child,
                  ),
                );
              case RouteAnimation.topLeftToBottomRightWithRotation:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1, -1),
                    end: const Offset(0, 0),
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                  ),
                  child: RotationTransition(
                    turns: animation,
                    child: child,
                  ),
                );
              case RouteAnimation.topRightToBottomLeftWithRotation:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, -1),
                    end: const Offset(0, 0),
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                  ),
                  child: RotationTransition(
                    turns: animation,
                    child: child,
                  ),
                );
              case RouteAnimation.bottomLeftToTopRightWithRotation:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1, 1),
                    end: const Offset(0, 0),
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                  ),
                  child: RotationTransition(
                    turns: animation,
                    child: child,
                  ),
                );
              case RouteAnimation.bottomRightToTopLeftWithRotation:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 1),
                    end: const Offset(0, 0),
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                  ),
                  child: RotationTransition(
                    turns: animation,
                    child: child,
                  ),
                );

              case RouteAnimation.topToBottomWithFadeAndRotate:
                return getSlideFadeAndRotateAnimation(
                    const Offset(0, -1), child);
              case RouteAnimation.bottomToTopWithFadeAndRotate:
                return getSlideFadeAndRotateAnimation(
                    const Offset(0, 1), child);
              case RouteAnimation.leftToRightWithFadeAndRotate:
                return getSlideFadeAndRotateAnimation(
                    const Offset(-1, 0), child);
              case RouteAnimation.rightToLeftWithFadeAndRotate:
                return getSlideFadeAndRotateAnimation(
                    const Offset(1, 0), child);
              case RouteAnimation.topLeftToBottomRightWithFadeAndRotate:
                return getSlideFadeAndRotateAnimation(
                    const Offset(-1, -1), child);
              case RouteAnimation.topRightToBottomLeftWithFadeAndRotate:
                return getSlideFadeAndRotateAnimation(
                    const Offset(1, -1), child);
              case RouteAnimation.bottomLeftToTopRightWithFadeAndRotate:
                return getSlideFadeAndRotateAnimation(
                    const Offset(-1, 1), child);
              case RouteAnimation.bottomRightToTopLeftWithFadeAndRotate:
                return getSlideFadeAndRotateAnimation(
                    const Offset(1, 1), child);

              case RouteAnimation.scale:
                return ScaleTransition(
                  scale: Tween<double>(
                    begin: 0,
                    end: 1,
                  ).animate(CurvedAnimation(
                    parent: animation,
                    curve: curve,
                  )),
                  child: child,
                );
              case RouteAnimation.topToBottomWithScale:
                return getSlideAndScaleAnimation(const Offset(0, -1), child);
              case RouteAnimation.bottomToTopWithScale:
                return getSlideAndScaleAnimation(const Offset(0, 1), child);
              case RouteAnimation.leftToRightWithScale:
                return getSlideAndScaleAnimation(const Offset(-1, 0), child);
              case RouteAnimation.rightToLeftWithScale:
                return getSlideAndScaleAnimation(const Offset(1, 0), child);
              case RouteAnimation.topLeftToBottomRightWithScale:
                return getSlideAndScaleAnimation(const Offset(-1, -1), child);
              case RouteAnimation.topRightToBottomLeftWithScale:
                return getSlideAndScaleAnimation(const Offset(1, -1), child);
              case RouteAnimation.bottomLeftToTopRightWithScale:
                return getSlideAndScaleAnimation(const Offset(-1, 1), child);
              case RouteAnimation.bottomRightToTopLeftWithScale:
                return getSlideAndScaleAnimation(const Offset(1, 1), child);

              case RouteAnimation.topToBottomWithFadeRotateAndScale:
                return getSlideFadeRotateAndScaleAnimation(
                    const Offset(0, -1), child);
              case RouteAnimation.bottomToTopWithFadeRotateAndScale:
                return getSlideFadeRotateAndScaleAnimation(
                    const Offset(0, 1), child);
              case RouteAnimation.leftToRightWithFadeRotateAndScale:
                return getSlideFadeRotateAndScaleAnimation(
                    const Offset(-1, 0), child);
              case RouteAnimation.rightToLeftWithFadeRotateAndScale:
                return getSlideFadeRotateAndScaleAnimation(
                    const Offset(1, 0), child);
              case RouteAnimation.topLeftToBottomRightWithFadeRotateAndScale:
                return getSlideFadeRotateAndScaleAnimation(
                    const Offset(-1, -1), child);
              case RouteAnimation.topRightToBottomLeftWithFadeRotateAndScale:
                return getSlideFadeRotateAndScaleAnimation(
                    const Offset(1, -1), child);
              case RouteAnimation.bottomLeftToTopRightWithFadeRotateAndScale:
                return getSlideFadeRotateAndScaleAnimation(
                    const Offset(-1, 1), child);
              case RouteAnimation.bottomRightToTopLeftWithFadeRotateAndScale:
                return getSlideFadeRotateAndScaleAnimation(
                    const Offset(1, 1), child);
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
