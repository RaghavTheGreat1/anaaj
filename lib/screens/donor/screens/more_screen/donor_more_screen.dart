import 'package:anaaj/providers/app_user_providers.dart';
import 'package:anaaj/services/authentication_services.dart';
import 'package:anaaj/widgets/tile_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DonorMoreScreen extends HookConsumerWidget {
  const DonorMoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("More"),
      ),
      body: TileLayout(
        onTap: () async {
          await FirebaseAuth.instance.signOut();
          ref.read(appUserProvider.notifier).state = null;
        },
        listTile: ListTile(
          title: Text('Sign Out'),
        ),
      ),
    );
  }
}
