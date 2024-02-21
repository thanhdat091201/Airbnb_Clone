import 'package:front_end/ui/screens/details_screen/confirm_pay_screen.dart';
import 'package:front_end/ui/screens/splash_screen.dart';
import 'package:front_end/ui/screens/details_screen/details_screen.dart';
import 'package:front_end/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'route_constants.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.initialRoute:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case RouteConstants.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case RouteConstants.detailsScreen:
        return MaterialPageRoute(
          builder: (context) => const DetailsScreen(),
        );

      case RouteConstants.confirmScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const ConfirmPayScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0); // Điểm bắt đầu (phải)
            const end = Offset.zero; // Điểm kết thúc (trái)
            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );

      case RouteConstants.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      default:
        throw Exception('Invalid route: ${settings.name}');
        return MaterialPageRoute(builder: (context) => Container());
    }
  }
}
