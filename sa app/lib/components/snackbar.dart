import 'package:flutter/material.dart';

import '../constants/constants.dart';

void showSnack(context, message) {
  if (context != null) {
    final snackBar = SnackBar(
      content: Text(message.toString()),
      // shape: const CircleBorder(eccentricity: 76),
      backgroundColor: Colors.teal,
      duration: Duration(seconds: 6),

    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
