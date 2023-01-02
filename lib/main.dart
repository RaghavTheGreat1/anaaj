import 'package:anaaj/services/app_initializer_service.dart';
import 'package:anaaj/themes/light_theme.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppInitializerService.instance.initialize();

  final fcmToken = await FirebaseMessaging.instance.getToken();
  print("fcmToken");
  print(fcmToken);

  runApp(
    ProviderScope(
      child: const AnaajApp(),
    ),
  );
}

class AnaajApp extends HookConsumerWidget {
  const AnaajApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    print(ModalRoute.of(context)?.settings.name);
    return MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      theme: LightTheme().getTheme(),
    );
  }
}
