import 'package:http/http.dart';

import '../auth/auth_service.dart';
import 'http_headers.dart';

class AuthenticatedClient extends BaseClient {
  final Client _inner;
  final AuthService _authService;

  AuthenticatedClient({
    required AuthService authService,
    Client? client,
  })  : _inner = client ?? Client(),
        _authService = authService;

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    if (_authService.isLoggedIn) {
      final token = _authService.token;
      request.headers[HttpHeaders.authorization] = 'Bearer $token';
    }
    return _inner.send(request);
  }
}
