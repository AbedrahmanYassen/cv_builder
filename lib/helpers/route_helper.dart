import 'package:cv_builder/routes/add_info.dart';
import 'package:cv_builder/routes/home.dart';
import 'package:cv_builder/routes/on_boarding.dart';
import 'package:cv_builder/routes/show_hide_screen.dart';
import 'package:cv_builder/routes/sign_in.dart';
import 'package:cv_builder/routes/sign_up.dart';
import 'package:cv_builder/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteHelper {
  static const onBoardingRoute = "/";
  static const homeRoute = "/home";
  static const showHide = "/show_hide";
  static const addInfo = "/add_info";
  static const signUp = "/sign_up";
  static const signIn = "/sign_in";

  static Route manageRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case onBoardingRoute:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case homeRoute:
        return MaterialPageRoute(builder: (context) => const Home());
      case showHide:
        return MaterialPageRoute(builder: (context) => const ShowHideScreen());
      case addInfo:
        return MaterialPageRoute(builder: (context) => AddScreen());
      case signUp:
        return MaterialPageRoute(builder: (context) => const SignUp());
      case signIn:
        return MaterialPageRoute(builder: (context) => const SignIn());

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
