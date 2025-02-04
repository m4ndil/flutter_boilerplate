import 'package:flutter/material.dart';
import '../../presentation/screens/auth/login_screen.dart';
import '../../presentation/screens/dashboard/dashboard_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String menu = '/menu';
  static const String profile = '/profile';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => LoginPage(),
    dashboard: (context) => DashboardPage(),
    menu: (context) => MenuScreen(),
    profile: (context) => ProfileScreen(),
  };
}
