import '../../models/auth/user.dart';
import '../http/api_client.dart';
import 'auth_service.dart';

class UsersService {
  final ApiClient _client;
  final AuthService _authService;
  User? _user;

  UsersService(this._client, this._authService) {
    _authService.addListener(refresh);
  }

  User? get user => _user;

  Future<User?> refresh() async {
    if (!_authService.isLoggedIn) return null;
    try {
      final response = await _client.get('/users/me');
      final result = User.fromJson(response);
      _user = result;
      return result;
    } catch (error) {
      await _authService.logout();
      return null;
    }
  }
}
