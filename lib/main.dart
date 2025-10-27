import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/app_theme.dart';
import 'package:bookia/services/dio/dio_provider.dart';
import 'package:bookia/services/local/shared_pref.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // أضف هذا السطر

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioProvider.init();
  await SharedPref.init();
  await EasyLocalization.ensureInitialized();
  runApp(
    DevicePreview(
      enabled: !kDebugMode,
      builder: (context) => EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        startLocale: const Locale("ar"),
        path: 'assets/translations', // تأكد من أن هذا المسار صحيح
        fallbackLocale: const Locale("en"),
        child: const MainApp(),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.routes,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
    );
  }
}
