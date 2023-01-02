import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../services/internet_connection_checker.dart';
import '../../../../themes/custom_colors.dart';
import '../../../../widgets/buttons/loader_button.dart';
import '../../../../widgets/snackbars/show_failure_snackbar.dart';

String _verificationCode = "";

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({
    super.key,
    required this.phoneNumber,
    required this.onVerificationSuccessful,
  });

  final String phoneNumber;
  final Function onVerificationSuccessful;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String enteredOtp = "";

  @override
  void initState() {
    super.initState();
    verifyPhoneNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBar.large(
            title: Text('Verify phone number'),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                bottom: 16.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 24.0,
                            ),
                            child: Text(
                              'Enter the One Time Password sent to \n${widget.phoneNumber}',
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: PinCodeTextField(
                            appContext: context,
                            pastedTextStyle:
                                Theme.of(context).textTheme.titleMedium,
                            autoFocus: true,
                            length: 6,
                            cursorHeight: 0,
                            pinTheme: PinTheme(
                              selectedColor:
                                  Theme.of(context).colorScheme.primary,
                              inactiveColor:
                                  Theme.of(context).colorScheme.onBackground,
                              activeColor:
                                  Theme.of(context).colorScheme.onBackground,
                              shape: PinCodeFieldShape.box,
                              errorBorderColor: CustomColors.red,
                              borderRadius: BorderRadius.circular(17),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp("[0-9]"),
                              ),
                            ],
                            validator: (otp) {
                              if (otp!.length != 6) {
                                return '';
                              }
                              return null;
                            },
                            onChanged: (otp) {
                              enteredOtp = otp;
                            },
                            onSubmitted: (otp) {
                              enteredOtp = otp;
                            },
                          ),
                        ),
                      ),
                      ResendOtpButton(
                        onTimeout: verifyPhoneNumber,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 56,
                          child: LoaderButton(
                            label: Text(
                              'SUBMIT OTP',
                            ),
                            onPressed: signUser,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> signUser() async {
    formKey.currentState!.save();
    bool isValidated = formKey.currentState!.validate();
    if (isValidated) {
      final FirebaseAuth auth = FirebaseAuth.instance;
      await internetConnectionService(
        onInternetAvaiable: () async {
          try {
            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
              verificationId: _verificationCode,
              smsCode: enteredOtp,
            );
            await auth.signInWithCredential(phoneAuthCredential);
            _verificationCode = "";
            await widget.onVerificationSuccessful();
          } on FirebaseAuthException catch (e) {
            if (e.code == "invalid-verification-code") {
              showFailureSnackbar(
                context,
                title: 'Invalid OTP',
                message: 'Enter one time password',
                height: 0,
              );
            } else {
              showFailureSnackbar(
                context,
                title: 'Oh Snap',
                message: e.message,
                height: 0,
              );
            }
          }
        },
        onInternetUnavailable: () async {
          showFailureSnackbar(
            context,
            title: 'No Internet Connection',
            message: 'Please check your internet connection.',
            height: 0,
          );
        },
      );
    }
  }

  void verifyPhoneNumber() async {
    await internetConnectionService(
      onInternetAvaiable: () async {
        FirebaseAuth auth = FirebaseAuth.instance;
        try {
          await auth.verifyPhoneNumber(
            phoneNumber: '+91${widget.phoneNumber}',
            verificationCompleted: (phoneAuthCredential) async {
              await signUser();
            },
            verificationFailed: (error) {
              showFailureSnackbar(
                context,
                title: 'Verification Failed',
                message: error.message,
              );
            },
            codeSent: (verificationId, forceResendingToken) {
              _verificationCode = verificationId;
            },
            codeAutoRetrievalTimeout: (verificationId) {
              _verificationCode = verificationId;
            },
          );
        } catch (e) {
          showFailureSnackbar(
            context,
            title: 'Verification Failed',
            message: e.toString(),
            height: 0,
          );
        }
      },
    );
  }
}

class ResendOtpButton extends StatefulWidget {
  const ResendOtpButton({
    Key? key,
    this.onTimeout,
  }) : super(key: key);

  final VoidCallback? onTimeout;
  @override
  State<ResendOtpButton> createState() => _ResendOtpButtonState();
}

class _ResendOtpButtonState extends State<ResendOtpButton> {
  late Timer timer;

  late ValueNotifier<int> timeOut;

  @override
  initState() {
    super.initState();
    timeOut = ValueNotifier(45);
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (timeOut.value != 0) {
          timeOut.value = timeOut.value - 1;
        } else {
          timer.cancel();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: timeOut,
      builder: (context, value, _) {
        return TextButton(
          onPressed: value != 0
              ? null
              : () {
                  if (widget.onTimeout != null) {
                    widget.onTimeout!();
                  }
                  setState(() {
                    timer = Timer.periodic(
                      const Duration(seconds: 1),
                      (timer) {
                        if (timeOut.value != 0) {
                          timeOut.value = timeOut.value - 1;
                        } else {
                          timer.cancel();
                        }
                      },
                    );
                    timeOut.value = 45;
                  });
                },
          child: Text(
            value != 0 ? 'Resend OTP in $value seconds' : 'Resend OTP',
          ),
        );
      },
    );
  }
}
