import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'routes/app_router.dart';
import 'theme/app_theme.dart';
import 'services/storage/hive_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveService.initialize();

  runApp(const ProviderScope(child: SmartApp()));
}

class SmartApp extends StatelessWidget {
  const SmartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'SMART',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: appRouter,
    );
  }
}
