import 'package:anaaj/models/app_user.dart';
import 'package:anaaj/services/authentication_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// remove after testing with emulator
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notification_permissions/notification_permissions.dart';

import '../firebase_options.dart';
import '../models/role.dart';
import '../providers/app_user_providers.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  print("Handling a background message: ${message.messageId}");
}

class AppInitializerService {
  AppInitializerService._private();

  static AppInitializerService instance = AppInitializerService._private();

  /// Overrides for initializing Riverpod Providers
  List<Override> riverpodOverrides = [];

  Future<String?> initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;

    // auth.useAuthEmulator("192.168.214.49", 8081);
    // firestore.useFirestoreEmulator("192.168.214.49", 8081);

    // await FirebaseAuth.instance.useAuthEmulator("192.168.214.49", 9099);
    // FirebaseFirestore.instance.useFirestoreEmulator("192.168.214.49", 8081);

    PermissionStatus permissionStatus =
        await NotificationPermissions.getNotificationPermissionStatus();
    if (permissionStatus == PermissionStatus.denied ||
        permissionStatus == PermissionStatus.unknown) {
      await NotificationPermissions.requestNotificationPermissions();
    }

    final fcmToken = await FirebaseMessaging.instance.getToken();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await _configureSystem();
    await Hive.initFlutter();
    await verifyUser();
    print("app init finished");
    return fcmToken;
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

  Future<Role> fetchSignedInRole() async {
    Box userBox = await Hive.openBox('user');

    int roleIndex = userBox.get('signed_in_role_index', defaultValue: 2);

    return RoleExt.getRoleByIndex(roleIndex);
  }

  Future<void> verifyUser() async {
    AuthenticationServices auth = AuthenticationServices();
    User? user = FirebaseAuth.instance.currentUser;
    print(user);
    if (user != null) {
      Role signedRole = await fetchSignedInRole();
      late Object? fetchedUser;

      try {
        fetchedUser = await auth.fetchUserByPhoneNumber(
          int.parse(user.phoneNumber!.substring(3)),
          signedRole,
        );
      } catch (err) {
        fetchedUser = null;
      }

      if (fetchedUser == null) {
        await FirebaseAuth.instance.signOut();
      } else {
        AppUser appUser = AppUser(appUser: fetchedUser);

        riverpodOverrides.add(
          appUserProvider.overrideWith(
            (ref) {
              return appUser;
            },
          ),
        );
      }
    }
  }
}
