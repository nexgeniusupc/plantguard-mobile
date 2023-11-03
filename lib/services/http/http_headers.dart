class HttpHeaders {
  static const userAgent = 'user-agent';
  static const contentType = 'content-type';
  static const authorization = 'authorization';

  final Map<String, String> _headers;

  HttpHeaders() : _headers = {};
  HttpHeaders.fromHeaders(HttpHeaders init) : _headers = init._headers;
  HttpHeaders.fromMap(Map<String, String> init) : _headers = init;

  static String _normalize(String name) {
    return name.trim().toLowerCase();
  }

  static List<String> _valueAsList(String value) {
    return value.split(',').map((v) => v.trimLeft()).toList();
  }

  String? get(String name) {
    return _headers[_normalize(name)];
  }

  bool has(String name) {
    return _headers.containsKey(_normalize(name));
  }

  void set(String name, String value) {
    _headers[_normalize(name)] = value;
  }

  void append(String name, String value) {
    _headers.update(
      _normalize(name),
      (current) {
        final parts = _valueAsList(current);
        parts.add(value);
        return parts.join(', ');
      },
      ifAbsent: () => value,
    );
  }

  void delete(String name) {
    _headers.remove(_normalize(name));
  }

  Map<String, String> toMap() {
    return Map.of(_headers);
  }

  Iterable<MapEntry<String, String>> get entries {
    return _headers.entries;
  }

  Iterable<String> keys() {
    return _headers.keys;
  }

  Iterable<String> values() {
    return _headers.values;
  }
}
