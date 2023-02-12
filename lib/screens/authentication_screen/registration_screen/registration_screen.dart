import 'package:anaaj/models/address.dart';
import 'package:anaaj/models/donor_instituition.dart';
import 'package:anaaj/models/volunteer.dart';
import 'package:anaaj/providers/fcm_provider.dart';
import 'package:anaaj/screens/authentication_screen/screens/otp_verification_screen/otp_verification_screen.dart';
import 'package:anaaj/services/authentication_services.dart';
import 'package:anaaj/widgets/buttons/loader_button.dart';
import 'package:anaaj/widgets/textfields/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../models/app_user.dart';
import '../../../models/receiver_instituition.dart';
import '../../../models/role.dart';
import '../../../providers/app_user_providers.dart';

class RegistrationScreen extends StatefulHookConsumerWidget {
  const RegistrationScreen({
    super.key,
    required this.role,
    required this.phoneNumber,
  });

  final Role role;
  final int phoneNumber;

  @override
  ConsumerState<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends ConsumerState<RegistrationScreen> {
  String name = "";
  late int phoneNumber;
  late Address address;
  String emailAddress = "";
  late String? fcmToken;

  @override
  void initState() {
    super.initState();
    phoneNumber = widget.phoneNumber;
    String id = Uuid().v1();
    address = Address(
      id: id,
      streetAddress: "",
      city: "",
      state: "",
      country: "",
      pincode: "",
    );
    fcmToken = ref.read(fcmTokenProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Register as ${widget.role.capName}"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Expanded(
              child: Form(
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${widget.role.capName} Name',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                CustomTextFormField(
                                  label: 'Name',
                                  onChanged: (value) {
                                    name = value;
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Phone Number',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                CustomTextFormField(
                                  label: 'Phone number',
                                  hintText: 'xxxxx xxxxx',
                                  initialValue: phoneNumber.toString(),
                                  onChanged: (value) {
                                    phoneNumber = int.parse(value);
                                  },
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[0-9]')),
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
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Email Address',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              CustomTextFormField(
                                label: 'Email Address',
                                onChanged: (value) {
                                  emailAddress = value;
                                },
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Street Address',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              CustomTextFormField(
                                label: 'Street Address',
                                onChanged: (value) {
                                  address = address.copyWith(
                                    streetAddress: value,
                                  );
                                },
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'City',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      CustomTextFormField(
                                        label: 'City',
                                        onChanged: (value) {
                                          address = address.copyWith(
                                            city: value,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'State',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      CustomTextFormField(
                                        label: 'State',
                                        onChanged: (value) {
                                          address = address.copyWith(
                                            state: value,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Country',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      CustomTextFormField(
                                        label: 'Country',
                                        onChanged: (value) {
                                          address = address.copyWith(
                                            country: value,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Pincode',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      CustomTextFormField(
                                        label: 'Pincode',
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {
                                          address = address.copyWith(
                                            pincode: value,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: LoaderButton(
                    label: Text('Register'),
                    onPressed: () async {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => OtpVerificationScreen(
                            phoneNumber: phoneNumber.toString(),
                            onVerificationSuccessful: registerUser,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void registerUser(PhoneAuthCredential phoneAuthCredential) async {
    Navigator.pop(context);
    AuthenticationServices auth = AuthenticationServices();
    switch (widget.role) {
      case Role.donor:
        DonorInstituition donor = DonorInstituition(
          id: phoneNumber.toString(),
          name: name,
          phoneNumber: phoneNumber,
          emailAddress: emailAddress,
          address: address,
        );
        await auth.createDonorInstituition(
          donor,
          phoneAuthCredential,
        );
        AppUser appUser = AppUser(appUser: donor);
        ref.read(appUserProvider.notifier).state = appUser;
        break;
      case Role.volunteer:
        Volunteer volunteer = Volunteer(
          id: phoneNumber.toString(),
          name: name,
          phoneNumber: phoneNumber,
          emailAddress: emailAddress,
          address: address,
          fcmToken: fcmToken,
          isAvailable: true,
        );
        await auth.createVolunteer(
          volunteer,
          phoneAuthCredential,
        );
        AppUser appUser = AppUser(appUser: volunteer);
        ref.read(appUserProvider.notifier).state = appUser;
        break;
      case Role.receiver:
        ReceiverInstituition recevier = ReceiverInstituition(
          id: phoneNumber.toString(),
          name: name,
          phoneNumber: phoneNumber,
          emailAddress: emailAddress,
          address: address,
          fcmToken: fcmToken,
        );
        await auth.createReceiverInstituition(
          recevier,
          phoneAuthCredential,
        );
        AppUser appUser = AppUser(appUser: recevier);
        ref.read(appUserProvider.notifier).state = appUser;
        break;

      default:
    }
    Box userBox = await Hive.openBox('user');
    await userBox.put('signed_in_role_index', widget.role.index);
  }
}
