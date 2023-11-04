import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/auth/auth_service.dart';
import 'login_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  String fullName = '';
  String preferredName = '';
  String email = '';
  String password = '';

  Future<void> handleSubmit(BuildContext context) async {
    final formState = _formKey.currentState;
    if (formState == null) return;
    if (formState.validate()) {
      formState.save();
      final authService = context.read<AuthService>();
      // TODO: Add error handling
      await authService.register(
        email: email,
        password: password,
        fullName: fullName,
        preferredName: preferredName,
      );
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginView(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
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
                        label: Text('Full name'),
                        hintText: 'John Doe',
                      ),
                      keyboardType: TextInputType.name,
                      autofillHints: const [AutofillHints.name],
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Required';
                        return null;
                      },
                      onSaved: (value) => fullName = value!,
                    ),
                    SizedBox.fromSize(size: const Size.fromHeight(16.0)),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Preferred name'),
                        hintText: 'John',
                      ),
                      keyboardType: TextInputType.name,
                      autofillHints: const [AutofillHints.nickname],
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Required';
                        return null;
                      },
                      onSaved: (value) => preferredName = value!,
                    ),
                    SizedBox.fromSize(size: const Size.fromHeight(16.0)),
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
                      autofillHints: const [AutofillHints.newPassword],
                      autocorrect: false,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Required';
                        if (value.length < 8) return 'Minimum 8 characters';
                        return null;
                      },
                      onChanged: (value) => password = value,
                      onSaved: (value) => password = value!,
                    ),
                    SizedBox.fromSize(size: const Size.fromHeight(16.0)),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Confirm password'),
                      ),
                      autofillHints: const [AutofillHints.newPassword],
                      autocorrect: false,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Required';
                        if (value.length < 8) return 'Minimum 8 characters';
                        if (value != password) return "Passwords don't match";
                        return null;
                      },
                    ),
                    SizedBox.fromSize(size: const Size.fromHeight(16.0)),
                    FilledButton(
                      onPressed: () => handleSubmit(context),
                      child: const Text('Register'),
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
