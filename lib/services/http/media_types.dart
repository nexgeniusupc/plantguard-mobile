import 'package:http_parser/http_parser.dart';

class _ApplicationMediaType {
  static const type = 'application';

  _ApplicationMediaType();

  final json = MediaType(type, 'json');
}

abstract class MediaTypes {
  static final application = _ApplicationMediaType();

  static bool equals(MediaType a, MediaType b) {
    return a.type == b.type && a.subtype == b.subtype;
  }
}
