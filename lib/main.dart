import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'env.dart' as env;
import 'services/auth/auth_service.dart';
import 'services/auth/users_service.dart';
import 'services/devices/devices_service.dart';
import 'services/http/api_client.dart';
import 'services/http/authenticated_client.dart';
import 'services/http/user_agent_client.dart';
import 'services/pairing/pairing_service.dart';
import 'utils/deprecated_keys_migrator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await migrateDeprecatedKeys();

  final packageInfo = await PackageInfo.fromPlatform();
  final userAgent = '${packageInfo.appName} (v${packageInfo.version})';

  final authService = AuthService();
  final apiClient = ApiClient(
    AuthenticatedClient(
      authService: authService,
      client: UserAgentClient(userAgent),
    ),
    authority: env.apiAuthority,
    base: env.apiBase,
  );
  final pairingService = PairingService(apiClient);
  final usersService = UsersService(apiClient, authService);
  final devicesService = DevicesService(apiClient);

  await authService.init(apiClient);
  await usersService.refresh();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: authService),
        Provider.value(value: apiClient),
        Provider.value(value: pairingService),
        Provider.value(value: usersService),
        Provider.value(value: devicesService),
      ],
      child: const PlantGuardApp(),
    ),
  );
}
