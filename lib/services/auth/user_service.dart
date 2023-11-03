import '../../models/auth/user.dart';
import '../http/api_client.dart';

class UserService {
  final ApiClient _client;
  User? _user;

  UserService(this._client);

  User? get user => _user;

  Future<User> refresh() async {
    final response = await _client.get('/users/me');
    final result = User.fromJson(response);
    _user = result;
    return result;
  }
}
