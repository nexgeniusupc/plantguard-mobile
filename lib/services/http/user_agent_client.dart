import 'package:http/http.dart';

import 'http_headers.dart';

class UserAgentClient extends BaseClient {
  final String userAgent;
  final Client _inner;

  UserAgentClient(this.userAgent, {Client? client})
      : _inner = client ?? Client();

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    request.headers[HttpHeaders.userAgent] = userAgent;
    return _inner.send(request);
  }
}
