import 'package:flutter/material.dart';
import 'package:page_route_animator/page_route_animator.dart';

void main(List<String> args) => runApp(const MyApp());

/// This widget is the root of your app.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Page Route Animator Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomeScreen(),

      /// using onGenerateRoute
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/second-screen':
            return PageRouteAnimator(
              child: const SecondScreen(),
              routeAnimation: RouteAnimation.topToBottom,
              settings: settings,
              curve: Curves.linear,
              duration: const Duration(milliseconds: 500),
              reverseDuration: const Duration(milliseconds: 500),
            );
          default:
            return null;
        }
      },
    );
  }
}

/// HomeScreen
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            /// Push using onGenerateRoute
            /// Navigator.pushNamed()
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/second-screen',
                  arguments: 'I am going',
                );
              },
              child: getText('Top To Bottom - Using onGenerateRoute'),
            ),

            /// Navigator.push()
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.bottomToTop,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.slowMiddle,
                    duration: const Duration(milliseconds: 500),
                    reverseDuration: const Duration(milliseconds: 500),
                  ),
                );
              },
              child: getText('Bottom To Top'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.leftToRight,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Left To Right'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.rightToLeft,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Right To left'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.topLeftToBottomRight,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('TopLeft To BottomRight'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.topRightToBottomLeft,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('TopRight To BottomLeft'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.bottomLeftToTopRight,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('BottomLeft To TopRight'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.bottomRightToTopLeft,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('BottomRight To TopLeft'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.fade,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Fade'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.rotate,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Rotate'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.scale,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Scale'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.size,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Size'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.sizeFromTop,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Size From Top'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.sizeFromBottom,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Size From Bottom'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.fadeAndRotate,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Fade And Rotate'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.fadeAndScale,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Fade And Scale'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.rotateAndScale,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Rotate And Scale'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.fadeRotateAndScale,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Fade, Rotate And Scale'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    currentChild: this,
                    child: const SecondScreen(),
                    duration: const Duration(milliseconds: 500),
                    reverseDuration: const Duration(milliseconds: 500),
                    routeAnimation: RouteAnimation.topToBottomJoined,
                    settings: const RouteSettings(arguments: 'I am going'),
                  ),
                );
              },
              child: getText('Top To Bottom Joined'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    currentChild: this,
                    child: const SecondScreen(),
                    duration: const Duration(milliseconds: 500),
                    reverseDuration: const Duration(milliseconds: 500),
                    routeAnimation: RouteAnimation.bottomToTopJoined,
                    settings: const RouteSettings(arguments: 'I am going'),
                  ),
                );
              },
              child: getText('Bottom To Top Joined'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    currentChild: this,
                    child: const SecondScreen(),
                    duration: const Duration(milliseconds: 500),
                    reverseDuration: const Duration(milliseconds: 500),
                    routeAnimation: RouteAnimation.leftToRightJoined,
                    settings: const RouteSettings(arguments: 'I am going'),
                  ),
                );
              },
              child: getText('Left To Right Joined'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    currentChild: this,
                    child: const SecondScreen(),
                    duration: const Duration(milliseconds: 500),
                    reverseDuration: const Duration(milliseconds: 500),
                    routeAnimation: RouteAnimation.rightToLeftJoined,
                    settings: const RouteSettings(arguments: 'I am going'),
                  ),
                );
              },
              child: getText('Right To Left Joined'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.topToBottomWithFade,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Top To Bottom With Fade'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.bottomToTopWithFade,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Bottom To Top With Fade'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.leftToRightWithFade,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Left To Right With Fade'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.rightToLeftWithFade,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Right To Left With Fade'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.topLeftToBottomRightWithFade,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('TopLeft To BottomRight With Fade'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.topRightToBottomLeftWithFade,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('TopRight To BottomLeft With Fade'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.bottomLeftToTopRightWithFade,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('BottomLeft To TopRight With Fade'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.bottomRightToTopLeftWithFade,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('BottomRight To TopLeft With Fade'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.topToBottomWithScale,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Top To Bottom With Scale'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.bottomToTopWithScale,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Bottom To Top With Scale'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.leftToRightWithScale,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Left To Right With Scale'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.rightToLeftWithScale,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Right To Left With Scale'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation:
                        RouteAnimation.topLeftToBottomRightWithScale,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('TopLeft To BottomRight With Scale'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation:
                        RouteAnimation.topRightToBottomLeftWithScale,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('TopRight To BottomLeft With Scale'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation:
                        RouteAnimation.bottomLeftToTopRightWithScale,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('BottomLeft To TopRight With Scale'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation:
                        RouteAnimation.bottomRightToTopLeftWithScale,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('BottomRight To TopLeft With Scale'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.topToBottomWithRotation,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Top To Bottom With Rotation'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.bottomToTopWithRotation,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Bottom To Top With Rotation'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.leftToRightWithRotation,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Left To Right With Rotation'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.rightToLeftWithRotation,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Right To Left With Rotation'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation:
                        RouteAnimation.topLeftToBottomRightWithRotation,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('TopLeft To BottomRight With Rotation'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation:
                        RouteAnimation.topRightToBottomLeftWithRotation,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('TopRight To BottomLeft With Rotation'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation:
                        RouteAnimation.bottomLeftToTopRightWithRotation,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('BottomLeft To TopRight With Rotation'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation:
                        RouteAnimation.bottomRightToTopLeftWithRotation,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('BottomRight To TopLeft With Rotation'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.topToBottomWithFadeAndRotate,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Top To Bottom With Fade And Rotate'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.bottomToTopWithFadeAndRotate,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Bottom To Top With Fade And Rotate'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.leftToRightWithFadeAndRotate,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Left To Right With Fade And Rotate'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation.rightToLeftWithFadeAndRotate,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Right To Left With Fade And Rotate'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation:
                        RouteAnimation.topLeftToBottomRightWithFadeAndRotate,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('TopLeft To BottomRight With Fade And Rotate'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation:
                        RouteAnimation.topRightToBottomLeftWithFadeAndRotate,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('TopRight To BottomLeft With Fade And Rotate'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation:
                        RouteAnimation.bottomLeftToTopRightWithFadeAndRotate,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('BottomLeft To TopRight With Fade And Rotate'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation:
                        RouteAnimation.bottomRightToTopLeftWithFadeAndRotate,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('BottomRight To TopLeft With Fade And Rotate'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation:
                        RouteAnimation.topToBottomWithFadeRotateAndScale,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Top To Bottom With Fade, Rotate And Scale'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation:
                        RouteAnimation.bottomToTopWithFadeRotateAndScale,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Bottom To Top With Fade, Rotate And Scale'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation:
                        RouteAnimation.leftToRightWithFadeRotateAndScale,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Left To Right With Fade, Rotate And Scale'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation:
                        RouteAnimation.rightToLeftWithFadeRotateAndScale,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child: getText('Right To Left With Fade, Rotate And Scale'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation
                        .topLeftToBottomRightWithFadeRotateAndScale,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child:
                  getText('TopLeft To BottomRight With Fade, Rotate And Scale'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation
                        .topRightToBottomLeftWithFadeRotateAndScale,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child:
                  getText('TopRight To BottomLeft With Fade, Rotate And Scale'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation
                        .bottomLeftToTopRightWithFadeRotateAndScale,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child:
                  getText('BottomLeft To TopRight With Fade, Rotate And Scale'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const SecondScreen(),
                    routeAnimation: RouteAnimation
                        .bottomRightToTopLeftWithFadeRotateAndScale,
                    settings: const RouteSettings(arguments: 'I am going'),
                    curve: Curves.easeOut,
                  ),
                );
              },
              child:
                  getText('BottomRight To TopLeft With Fade, Rotate And Scale'),
            ),
          ],
        ),
      ),
    );
  }
}

/// SecondScreen
class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? argument = ModalRoute.of(context)?.settings.arguments as String?;
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: const Text('SecondScreen'),
      ),
      body: Center(
        child: Text(
          argument ?? 'No Data',
          style: const TextStyle(
            fontSize: 48.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

/// ThirdScreen
class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ThirdScreen'),
      ),
    );
  }
}

Widget getText(String text) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(text),
  );
}
