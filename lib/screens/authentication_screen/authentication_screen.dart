import 'package:anaaj/models/donor_instituition.dart';
import 'package:anaaj/models/receiver_instituition.dart';
import 'package:anaaj/models/role.dart';
import 'package:anaaj/models/volunteer.dart';
import 'package:anaaj/router/route_paths_helper.dart';
import 'package:anaaj/services/authentication_services.dart';
import 'package:anaaj/widgets/textfields/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

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

  void setVerificationId(String code) {
    setState(() {
      verification_id = code;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool code_sent = ref.watch(codeSentProvider);

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
                  textInputAction: TextInputAction.done,
                )),
                ElevatedButton(
                  onPressed: () async {
                    print("pressed");
                    print(verification_id);
                    if (verification_id != null)
                      await auth.verifyCode(verification_id!, code.toString());
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
                      print("onSubmit");

                      // await auth.createVolunteer(
                      //   phoneNumber,
                      //   ref,
                      //   verification_id,
                      //   setVerificationId,
                      // );

                      final user = await auth.fetchUserByPhoneNumber(
                        phoneNumber,
                        selectedRole,
                      );
                      print("user");
                      print(user);
                      if (user != null) {
                        print("user not null");
                        switch (selectedRole) {
                          case Role.donor:
                            user as DonorInstituition;
                            context.go(
                              RoutePathsHelper.verifyPhoneNumber(
                                user.phoneNumber,
                              ),
                              extra: AppUser(
                                appUser: user,
                              ),
                            );
                            break;
                          case Role.volunteer:
                            print("going to otp verification screen");
                            user as Volunteer;
                            context.go(
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
                        print("user null");
                        context.go(RoutePathsHelper.register);
                      }
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
