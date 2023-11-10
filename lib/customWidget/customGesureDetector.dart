import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomGestureDetector extends StatelessWidget {
  Widget child;
  CustomGestureDetector({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: child,
    );
  }
}
