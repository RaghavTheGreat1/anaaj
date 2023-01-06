import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CupertinoBackButton extends StatelessWidget {
  const CupertinoBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.pop();
      },
      icon: Icon(
        Icons.chevron_left_rounded,
      ),
    );
  }
}
