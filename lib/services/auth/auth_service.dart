import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/auth/user.dart';
import '../http/api_client.dart';

class AuthService with ChangeNotifier {
  static const _tokenKey = 'auth:token';

  late ApiClient _client;
  bool initialized = false;
  String? _token;

  AuthService();

  bool get isLoggedIn => _token != null;

  String? get token => _token;

  Future<void> init(ApiClient client) async {
    assert(!initialized, 'AuthService has already been initialized');
    await _loadToken();
    _client = client;
    initialized = true;
  }

  void _updateToken(String? token) {
    _token = token;
    notifyListeners();
  }

  Future<void> _loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_tokenKey);
    if (token != null) {
      _updateToken(token);
    }
  }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    _updateToken(token);
  }

  Future<void> _removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    _updateToken(null);
  }

  Future<User> login({required String email, required String password}) async {
    assert(initialized, "AuthService hasn't been initialized yet");
    final request = LoginRequest(email: email, password: password);
    final response = await _client.post('/auth/login', body: request);
    final result = LoginResponse.fromJson(response);

    await _saveToken(result.jwt);

    return result.user;
  }

  Future<bool> register({
    required String email,
    required String password,
    required String fullName,
    required String preferredName,
  }) async {
    assert(initialized, "AuthService hasn't been initialized yet");
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
    await _removeToken();
  }
}
