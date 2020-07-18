import '../screens/home/home.dart';
import '../screens/login/login.dart';
import 'package:flutter/material.dart';
import '../screens/about/aboutUs.dart';
import '../screens/gallery/gallery.dart';
import '../screens/statistics/statistics.dart';
import '../screens/settings/settingsScreen.dart';
import '../screens/river-statistics/riverStatistics.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => MyHomePage(title: 'Home'));
      case '/statistics':
        return MaterialPageRoute(
            builder: (_) => Statistics(title: 'Statistics'));
      case '/river-statistics':
        return MaterialPageRoute(
            builder: (_) => RiverStatistics(title: 'RiverStatistics'));
      case '/gallery':
        return MaterialPageRoute(builder: (_) => Gallery());
      case '/about':
        return MaterialPageRoute(builder: (_) => AboutUs(title: 'About Us'));
      case '/settings':
        return MaterialPageRoute(builder: (_) => Settings(title: 'Settings'));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
