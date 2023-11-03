import 'package:flutter/material.dart';

import 'services/auth/auth_service.dart';
import 'views/auth/unauthenticated_view.dart';
import 'views/home_view.dart';

class PlantGuardApp extends StatelessWidget {
  final AuthService _authService;

  const PlantGuardApp(this._authService, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlantGuard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: _authService.loggedIn
          ? const HomeView(title: 'PlantGuard')
          : UnauthenticatedView(_authService),
    );
  }
}
