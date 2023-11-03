import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../services/auth/auth_service.dart';
import 'login_view.dart';
import 'register_view.dart';

class UnauthenticatedView extends StatelessWidget {
  final AuthService _authService;

  const UnauthenticatedView(this._authService, {super.key});

  void handleRegisterButton(BuildContext context) {
    final route = MaterialPageRoute(
      builder: (context) => RegisterView(_authService),
    );
    Navigator.push(context, route);
  }

  void handleLoginButton(BuildContext context) {
    final route = MaterialPageRoute(
      builder: (context) => LoginView(_authService),
    );
    Navigator.push(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                    child: SvgPicture.asset(
                      'assets/plantguard-logo.svg',
                      semanticsLabel: 'PlantGuard logo',
                      height: 256.0,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                    child: const Center(
                      child: Text(
                        'Take care of your plants, wherever you are',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 36.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  FilledButton(
                    onPressed: () => handleRegisterButton(context),
                    child: const Text('Register'),
                  ),
                  FilledButton.tonal(
                    onPressed: () => handleLoginButton(context),
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
