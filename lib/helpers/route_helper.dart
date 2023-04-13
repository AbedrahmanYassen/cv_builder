
import 'package:cv_builder/routes/home.dart';
import 'package:cv_builder/routes/on_boarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class RouteHelper {
  static const onBoardingRoute = "/";
  static const homeRoute = "/home";
  static Route manageRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case onBoardingRoute:
        return MaterialPageRoute(builder: (context) => OnboardingScreen());
      case homeRoute:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (context) => const _UnKnownRoute());
    }
  }
}

class _UnKnownRoute extends StatelessWidget {
  const _UnKnownRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("UnKnown Route!"),
      ),
    );
  }
}
