import 'package:flutter/material.dart';

import '../../services/auth/auth_service.dart';
import '../home_view.dart';

class LoginView extends StatefulWidget {
  final AuthService _authService;

  const LoginView(this._authService, {super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  String email = '';
  String password = '';

  Future<void> handleSubmit() async {
    final formState = _formKey.currentState;
    if (formState == null) return;
    if (formState.validate()) {
      formState.save();
      // TODO: Add error handling
      await widget._authService.login(email: email, password: password);
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeView(title: 'PlantGuard'),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Email'),
                        hintText: 'john.doe@example.com',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const [AutofillHints.email],
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Required';
                        // TODO: Add some real email validation
                        if (!value.contains('@')) return 'Invalid email';
                        return null;
                      },
                      onSaved: (value) => email = value!,
                    ),
                    SizedBox.fromSize(size: const Size.fromHeight(16.0)),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Password'),
                      ),
                      autofillHints: const [AutofillHints.password],
                      autocorrect: false,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Required';
                        return null;
                      },
                      onSaved: (value) => password = value!,
                    ),
                    SizedBox.fromSize(size: const Size.fromHeight(16.0)),
                    FilledButton(
                      onPressed: handleSubmit,
                      child: const Text('Log in'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
