import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'app.dart';
import 'services/auth/auth_service.dart';
import 'services/http/api_client.dart';
import 'services/http/user_agent_client.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final packageInfo = await PackageInfo.fromPlatform();
  final userAgent = '${packageInfo.appName} (v${packageInfo.version})';

  Client client = UserAgentClient(userAgent);
  ApiClient apiClient = ApiClient(
    client,
    authority: 'localhost:8787',
    base: '/api/v1',
  );
  AuthService authService = AuthService(apiClient);
  await authService.load();

  runApp(PlantGuardApp(authService));
}
