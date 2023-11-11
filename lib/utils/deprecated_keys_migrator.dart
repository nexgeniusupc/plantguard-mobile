import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

@immutable
class DeprecatedKey {
  final String from;
  final String? to;

  const DeprecatedKey({required this.from, this.to});

  bool get shouldMigrate => to != null;

  Future<bool> migrate(SharedPreferences prefs) async {
    if (!prefs.containsKey(from)) return true;
    if (!shouldMigrate) return prefs.remove(from);
    final value = prefs.get(from);
    await prefs.remove(from);
    switch (value) {
      case final bool value:
        return prefs.setBool(to!, value);
      case final double value:
        return prefs.setDouble(to!, value);
      case final int value:
        return prefs.setInt(to!, value);
      case final String value:
        return prefs.setString(to!, value);
      case final List<String> value:
        return prefs.setStringList(to!, value);
      default:
        throw UnimplementedError('Unknown type: ${value.runtimeType}');
    }
  }
}

const List<DeprecatedKey> _deprecatedKeys = [
  DeprecatedKey(from: 'jwt', to: 'auth:token'),
];

Future<void> migrateDeprecatedKeys() async {
  final prefs = await SharedPreferences.getInstance();
  final futures = _deprecatedKeys.map((key) => key.migrate(prefs));
  await Future.wait(futures);
}
