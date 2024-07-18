import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezda_assesment/core/config/app_config.dart';
import 'package:tezda_assesment/core/providers/sharedpreference_provider.dart';
import 'package:tezda_assesment/core/routes/app_pages.dart';
import 'package:tezda_assesment/core/routes/app_routes.dart';
import 'package:tezda_assesment/core/services/shared_preference.dart';

import 'core/config/environment.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  EnvironmentConfig.setEnvironment(Environment.dev);
  final sharedPrefs = SharedPreferenceService();
  await sharedPrefs.init();
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferenceServiceProvider.overrideWithValue(sharedPrefs),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: AppConfig.debug,
      onGenerateRoute: AppRoute.generalRoute,
      initialRoute: splash,
    );
  }
}
