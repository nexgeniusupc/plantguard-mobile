import 'package:shared_preferences/shared_preferences.dart';

import '../../models/auth/user.dart';
import '../http/api_client.dart';

class AuthService {
  static const _jwtKey = 'jwt';

  final ApiClient _client;
  String? _jwt;

  AuthService(this._client);

  bool get loggedIn => _jwt != null;

  String? get jwt => _jwt;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    _jwt = prefs.getString(_jwtKey);
  }

  static Future<void> _save(String jwt) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_jwtKey, jwt);
  }

  static Future<void> _remove() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_jwtKey);
  }

  Future<User> login({required String email, required String password}) async {
    final request = LoginRequest(email: email, password: password);
    final response = await _client.post('/auth/login', body: request);
    final result = LoginResponse.fromJson(response);

    _jwt = result.jwt;
    await _save(result.jwt);

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
    _jwt = null;
    await _remove();
  }
}
