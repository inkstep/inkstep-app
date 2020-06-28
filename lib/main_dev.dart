import 'package:inkstep/utils/app_config.dart';
import 'package:inkstep/main.dart';
import 'package:flutter/material.dart';

void main() {
  setupApp();

  const API_URL = 'http://localhost:4567';

  final configuredApp = AppConfig(
    appName: 'inkstep DEV',
    flavourName: 'development',
    apiUrl: API_URL,
    child: Inkstep(
      apiUrl: API_URL,
    ),
  );

  runApp(configuredApp);
}
