import 'dart:async';

import 'package:anaaj/models/donor_instituition.dart';
import 'package:anaaj/models/receiver_instituition.dart';
import 'package:anaaj/models/role.dart';
import 'package:anaaj/models/volunteer.dart';
import 'package:anaaj/providers/fcm_provider.dart';
import 'package:anaaj/router/route_paths_helper.dart';
import 'package:anaaj/services/authentication_services.dart';
import 'package:anaaj/widgets/textfields/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../models/app_user.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../providers/code_sent_provider.dart';

class AuthenticationScreen extends StatefulHookConsumerWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  _AuthenticationScreen createState() => _AuthenticationScreen();
}

class _AuthenticationScreen extends ConsumerState<AuthenticationScreen> {
  // AuthenticationScreen({super.key});
  final auth = AuthenticationServices();
  Role selectedRole = Role.volunteer;
  int phoneNumber = 0000000000;
  int code = 0000;
  String? verification_id;

  Completer<UserCredential?> c = new Completer();

  void setVerificationId(String code) {
    setState(() {
      verification_id = code;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool code_sent = ref.watch(codeSentProvider);
    String? fcmToken = ref.watch(fcmTokenProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Anaaj"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextFormField(
              label: 'Phone number',
              hintText: 'xxxxx xxxxx',
              onChanged: (value) {
                setState(() {
                  phoneNumber = int.parse(value);
                });
              },
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              ],
              maxLength: 10,
              // textInputAction: TextInputAction.done,
              prefixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("+91"),
                ],
              ),
            ),
            if (code_sent)
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Expanded(
                    child: TextFormField(
                  onChanged: (value) {
                    code = int.parse(value);
                  },
                  keyboardType: TextInputType.phone,
                  maxLength: 6,
                  // textInputAction: TextInputAction.done,
                )),
                ElevatedButton(
                  onPressed: () async {
                    print("pressed");
                    print(verification_id);
                    if (verification_id != null)
                      await auth.verifyCode(
                          verification_id!, code.toString(), fcmToken, c);
                    else
                      print("verification_id is null");
                  },
                  child: Text("submit code"),
                ),
              ]),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      await auth.createVolunteer(phoneNumber, ref,
                          verification_id, setVerificationId, fcmToken, c);
                      print('createVolunteer finished');

                      final user = await auth.fetchUserByPhoneNumber(
                        phoneNumber,
                        selectedRole,
                      );
                      if (user != null) {
                        print("user not null");
                        Box userBox = await Hive.openBox('user');
                        await userBox.put(
                            'signed_in_role_index', selectedRole.index);
                        switch (selectedRole) {
                          case Role.donor:
                            user as DonorInstituition;
                            context.go(
                              '/auth' +
                                  RoutePathsHelper.verifyPhoneNumber(
                                    user.phoneNumber,
                                  ),
                              extra: AppUser(
                                appUser: user,
                              ),
                            );
                            break;
                          case Role.volunteer:
                            user as Volunteer;
                            context.go(
                              '/auth' +
                                  RoutePathsHelper.verifyPhoneNumber(
                                      user.phoneNumber),
                              extra: AppUser(
                                appUser: user,
                              ),
                            );
                            break;
                          case Role.receiver:
                            user as ReceiverInstituition;
                            context.go(
                              '/auth' +
                                  RoutePathsHelper.verifyPhoneNumber(
                                      user.phoneNumber),
                              extra: AppUser(
                                appUser: user,
                              ),
                            );
                            break;
                          default:
                        }
                      } else {
                        context.go(
                            '/auth/${RoutePathsHelper.register(phoneNumber)}');
                      }
                      print("user");
                      print(user);
                    },
                    child: Text("submit"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
