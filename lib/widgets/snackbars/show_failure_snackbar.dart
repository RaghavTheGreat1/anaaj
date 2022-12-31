import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

void showFailureSnackbar(
  BuildContext context, {
  String? title,
  String? message,
  double height = 0,
}) {
  final SnackBar snackBar = SnackBar(
    elevation: 0,
    padding: EdgeInsets.only(bottom: height, top: 24),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title ?? 'Oh Snap!',
      message: message ?? 'There was an error processing your request😟',
      contentType: ContentType.failure,
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
