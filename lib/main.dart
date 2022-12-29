import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'router/router.dart';

void main() {
  runApp(const AnaajApp());
}

class AnaajApp extends HookConsumerWidget {
  const AnaajApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      theme: ThemeData(),
    );
  }
}
