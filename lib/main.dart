import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/app_theme.dart';
import 'package:bookia/services/dio/dio_provider.dart';
import 'package:bookia/services/local/shared_pref.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioProvider.init();
  await SharedPref.init();
  runApp(
    DevicePreview(enabled: !kDebugMode, builder: (context) => const MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.routes,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
    );
  }
}
