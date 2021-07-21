import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String message;
  ErrorScreen(this.message);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Something went wrong"),
            Text(message),
          ],
        ),
      ),
    );
  }
}
