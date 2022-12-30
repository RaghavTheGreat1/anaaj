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

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Role selectedRole = Role.donor;
    int phoneNumber = 0000000000;
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
                phoneNumber = int.parse(value);
              },
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              ],
              maxLength: 10,
              textInputAction: TextInputAction.done,
              prefixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("+91"),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final auth = AuthenticationServices();

                      final user = await auth.fetchUserByPhoneNumber(
                        phoneNumber,
                        selectedRole,
                      );
                      if (user != null) {
                        switch (selectedRole) {
                          case Role.donor:
                            user as DonorInstituition;
                            context.go(RoutePathsHelper.verifyPhoneNumber(
                                user.phoneNumber));
                            break;
                          case Role.volunteer:
                            user as Volunteer;
                            context.go(RoutePathsHelper.verifyPhoneNumber(
                                user.phoneNumber));
                            break;
                          case Role.receiver:
                            user as ReceiverInstituition;
                            context.go(RoutePathsHelper.verifyPhoneNumber(
                                user.phoneNumber));
                            break;
                          default:
                        }
                      } else {
                        context.go(RoutePathsHelper.register);
                      }
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
