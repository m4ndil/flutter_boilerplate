import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/config/app_routes.dart';
import 'domain/providers/auth_provider.dart';
import 'domain/providers/item_provider.dart';
import 'core/config/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required for async calls
  final authProvider = AuthProvider();
  await authProvider.loadSession(); // Load session before app starts

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => authProvider),
        ChangeNotifierProvider(create: (_) => ItemProvider()),
      ],
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.login,
      routes: AppRoutes.routes,
    );
  }
}