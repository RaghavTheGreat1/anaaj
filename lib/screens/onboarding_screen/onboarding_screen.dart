import 'package:anaaj/router/route_paths_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('images/ANAAJ.gif'),
            SizedBox(
              height: 100,
            ),
            Text(
              '"Every meal served is an opportunity to make a positive impact in someones life. Join us in our mission to end hunger and create a better world, one plate at a time."',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      context.go(RoutePathsHelper.auth);
                    },
                    child: Text("GET STARTED"),
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
