import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/auth/user.dart';
import '../http/api_client.dart';

class AuthService with ChangeNotifier {
  static const _jwtKey = 'jwt';

  late ApiClient _client;
  String? _jwt;

  AuthService();

  bool get loggedIn => _jwt != null;

  String? get jwt => _jwt;

  set client(ApiClient client) => _client = client;

  Future<void> loadJwt() async {
    final prefs = await SharedPreferences.getInstance();
    final jwt = prefs.getString(_jwtKey);
    if (jwt != null) {
      _jwt = jwt;
      notifyListeners();
    }
  }

  Future<void> _saveJwt(String jwt) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_jwtKey, jwt);
    _jwt = jwt;
    notifyListeners();
  }

  Future<void> _removeJwt() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_jwtKey);
    _jwt = null;
    notifyListeners();
  }

  Future<User> login({required String email, required String password}) async {
    final request = LoginRequest(email: email, password: password);
    final response = await _client.post('/auth/login', body: request);
    final result = LoginResponse.fromJson(response);

    await _saveJwt(result.jwt);

    return result.user;
  }

  Future<bool> register({
    required String email,
    required String password,
    required String fullName,
    required String preferredName,
  }) async {
    final request = RegisterRequest(
      fullName: fullName,
      preferredName: preferredName,
      email: email,
      password: password,
    );
    final response = await _client.post('/auth/register', body: request);
    final result = RegisterResponse.fromJson(response);
    return result.success;
  }

  Future<void> logout() async {
    await _removeJwt();
  }
}
