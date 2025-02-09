import 'package:flutter/material.dart';

class AppConstants {
  static myTextFeild(
    final IconData icon,
    final Widget sufexIcon,
    final String hintText,
  ) =>
      InputDecoration(
        suffixIcon: sufexIcon,
        prefixIcon: Icon(icon),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      );
}
