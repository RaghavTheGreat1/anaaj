import 'package:anaaj/models/app_user.dart';
import 'package:anaaj/services/authentication_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../firebase_options.dart';
import '../models/role.dart';
import '../providers/app_user_providers.dart';

class AppInitializerService {
  AppInitializerService._private();

  static AppInitializerService instance = AppInitializerService._private();

  /// Overrides for initializing Riverpod Providers
  List<Override> riverpodOverrides = [];

  Future<void> initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await Hive.initFlutter();
    await _configureSystem();

    await verifyUser();
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

    if (user != null) {
      Role signedRole = await fetchSignedInRole();

      Object? fetchedUser = await auth.fetchUserByPhoneNumber(
        int.parse(user.phoneNumber!.substring(3)),
        signedRole,
      );

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
