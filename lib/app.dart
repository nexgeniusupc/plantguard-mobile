import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/auth/auth_service.dart';
import 'views/auth/unauthenticated_view.dart';
import 'views/home_view.dart';

class PlantGuardApp extends StatelessWidget {
  const PlantGuardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlantGuard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.light,
        ),
        textTheme: Typography.blackMountainView,
        appBarTheme: AppBarTheme(
          titleTextStyle: Typography.blackMountainView.titleMedium?.copyWith(
            fontSize: 24.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        cardTheme: const CardTheme(
          margin: EdgeInsets.all(0),
        ),
        listTileTheme: const ListTileThemeData(
          textColor: Colors.black,
        ),
        useMaterial3: true,
      ),
      home: Selector<AuthService, bool>(
        selector: (_, authService) => authService.isLoggedIn,
        builder: (_, isLoggedIn, __) {
          return isLoggedIn ? const HomeView() : const UnauthenticatedView();
        },
      ),
    );
  }
}
