import 'package:flutter/material.dart';
import 'package:tezda_assesment/core/routes/app_pages.dart';
import 'package:tezda_assesment/modules/authentication/view/screens/login.dart';
import 'package:tezda_assesment/modules/authentication/view/screens/profile.dart';
import 'package:tezda_assesment/modules/authentication/view/screens/register.dart';
import 'package:tezda_assesment/modules/splashscreen.dart';
import 'package:tezda_assesment/widgets/bottom_nav.dart';

class AppRoute {
  static Route easyAnimationRoute(Widget child) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Route<dynamic> generalRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return easyAnimationRoute(const SplashScreen());
      case register:
        return easyAnimationRoute(const Register());
      case login:
        return easyAnimationRoute(const Login());
      case bottomNav:
        return easyAnimationRoute(const BottomNavBar());
      case profile:
        return easyAnimationRoute( ProfileScreen());
      default:
        return easyAnimationRoute(const Login());
    }
  }
}
