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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
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
