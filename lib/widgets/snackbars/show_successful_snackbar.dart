import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

void showSuccessSnackbar(
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
      title: title ?? "Success!",
      message: message ?? 'The task was performed successfully!',
      contentType: ContentType.success,
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
