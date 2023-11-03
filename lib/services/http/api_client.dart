import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

import 'http_headers.dart';
import 'media_types.dart';

class ApiClient {
  final Uri base;
  final Client _client;

  ApiClient(
    this._client, {
    required String authority,
    String? base,
    bool https = true,
  }) : base = _prepareBaseUri(authority, base, https);

  static Uri _prepareBaseUri(String authority, String? base, bool https) {
    if (base != null && !base.endsWith('/')) {
      base = '$base/';
    }
    base ??= '/';
    if (https && !authority.split(':').contains('localhost')) {
      return Uri.https(authority, base);
    }
    return Uri.http(authority, base);
  }

  static Uri _resolveBaseUri(Uri base, String path) {
    if (path.startsWith('/')) {
      path = path.substring(1);
    }
    return base.resolve(path);
  }

  static HttpHeaders _createHeaders(HttpHeaders? init) {
    init = init != null ? HttpHeaders.fromHeaders(init) : HttpHeaders();
    if (!init.has(HttpHeaders.contentType)) {
      init.set(HttpHeaders.contentType, MediaTypes.application.json.mimeType);
    }
    return init;
  }

  static Request _createRequest(
    String method,
    Uri url,
    HttpHeaders? headers, [
    Object? body,
    Encoding? encoding,
  ]) {
    final request = Request(method, url);

    headers = _createHeaders(headers);
    request.headers.addAll(headers.toMap());

    if (encoding != null) request.encoding = encoding;

    request.body = jsonEncode(body);

    return request;
  }

  // TODO: Improve validation logic
  static dynamic _parseResponse(Response response) {
    final headers = HttpHeaders.fromMap(response.headers);
    final contentType = headers.get(HttpHeaders.contentType);

    if (contentType == null) {
      return response.body;
    }

    try {
      final parsed = MediaType.parse(contentType);
      if (!MediaTypes.equals(parsed, MediaTypes.application.json)) {
        return response.body;
      }
    } catch (error) {
      return response.body;
    }

    return jsonDecode(response.body);
  }

  Future<dynamic> _send(
    String method,
    String path,
    HttpHeaders? headers, [
    Object? body,
    Encoding? encoding,
  ]) async {
    final url = _resolveBaseUri(base, path);
    final request = _createRequest(method, url, headers, body, encoding);
    final response = await Response.fromStream(await _client.send(request));
    return _parseResponse(response);
  }

  Future<dynamic> head(String path, {HttpHeaders? headers}) =>
      _send('HEAD', path, headers);

  Future<dynamic> get(String path, {HttpHeaders? headers}) =>
      _send('GET', path, headers);

  Future<dynamic> post(
    String path, {
    HttpHeaders? headers,
    Object? body,
    Encoding? encoding,
  }) =>
      _send('POST', path, headers, body, encoding);

  Future<dynamic> put(
    String path, {
    HttpHeaders? headers,
    Object? body,
    Encoding? encoding,
  }) =>
      _send('PUT', path, headers, body, encoding);

  Future<dynamic> patch(
    String path, {
    HttpHeaders? headers,
    Object? body,
    Encoding? encoding,
  }) =>
      _send('PATCH', path, headers, body, encoding);

  Future<dynamic> delete(
    String path, {
    HttpHeaders? headers,
    Object? body,
    Encoding? encoding,
  }) =>
      _send('DELETE', path, headers, body, encoding);

  void close() => _client.close();
}
