library page_route_animator;

import 'route_animation.dart';
import 'package:flutter/material.dart';

class PageRouteAnimator<T> extends PageRouteBuilder<T> {
  PageRouteAnimator({
    super.barrierDismissible,
    super.barrierColor,
    super.barrierLabel,
    required Widget child,
    Widget? currentChild,
    Curve curve = Curves.linear,
    super.fullscreenDialog,
    super.maintainState,
    super.opaque,
    this.animationDuration = const Duration(milliseconds: 300),
    this.reverseAnimationDuration = const Duration(milliseconds: 300),
    required RouteAnimation routeAnimation,
    RouteSettings? settings,
  }) : super(
          transitionDuration: animationDuration,
          reverseTransitionDuration: reverseAnimationDuration,
          pageBuilder: (context, animation, secondaryAnimation) {
            return child;
          },
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) {
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

              default:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: const Offset(0, 0),
                  ).animate(
                    CurvedAnimation(parent: animation, curve: curve),
                  ),
                  child: child,
                );
            }
          },
        );

  Duration animationDuration;
  Duration reverseAnimationDuration;
}
