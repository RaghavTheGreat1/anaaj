import 'package:anaaj/widgets/textfields/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    onPressed: () {},
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
