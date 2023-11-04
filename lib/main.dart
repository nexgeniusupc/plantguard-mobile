import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'services/auth/auth_service.dart';
import 'services/http/api_client.dart';
import 'services/http/authenticated_client.dart';
import 'services/http/user_agent_client.dart';
import 'services/pairing/pairing_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final packageInfo = await PackageInfo.fromPlatform();
  final userAgent = '${packageInfo.appName} (v${packageInfo.version})';

  final authService = AuthService();
  final apiClient = ApiClient(
    AuthenticatedClient(
      authService: authService,
      client: UserAgentClient(userAgent),
    ),
    authority: 'localhost:8787',
    base: '/api/v1',
  );
  authService.client = apiClient;
  await authService.loadJwt();

  final pairingService = PairingService(apiClient);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: authService),
        Provider.value(value: apiClient),
        Provider.value(value: pairingService),
      ],
      child: const PlantGuardApp(),
    ),
  );
}
