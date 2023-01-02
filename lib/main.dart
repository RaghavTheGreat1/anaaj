import 'package:anaaj/providers/fcm_provider.dart';
import 'package:anaaj/services/app_initializer_service.dart';
import 'package:anaaj/themes/light_theme.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final fcmToken = await AppInitializerService.instance.initialize();

  runApp(
    ProviderScope(
      child: AnaajApp(fcmToken: fcmToken),
    ),
  );
}

class AnaajApp extends HookConsumerWidget {
  AnaajApp({super.key, required this.fcmToken});
  final String? fcmToken;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    ref.read(fcmTokenProvider.notifier).state = fcmToken;
    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
      ref.read(fcmTokenProvider.notifier).state = fcmToken;
    });

    return MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      theme: LightTheme().getTheme(),
    );
  }
}
