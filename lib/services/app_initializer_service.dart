import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// remove after testing with emulator
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../firebase_options.dart';

class AppInitializerService {
  AppInitializerService._private();

  static AppInitializerService instance = AppInitializerService._private();

  Future<void> initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseFirestore.instance.useFirestoreEmulator("192.168.214.49", 8081);
    FirebaseAuth.instance.useAuthEmulator("192.168.214.49", 9099);

    await _configureSystem();
  }

  Future<void> _configureSystem() async {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
