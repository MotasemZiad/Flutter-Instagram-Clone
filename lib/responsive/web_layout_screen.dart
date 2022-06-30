import 'package:flutter/material.dart';
import 'package:instagram_clone/resources/auth_methods.dart';

class WebLayoutScreen extends StatelessWidget {
  const WebLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is a web'),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () => AuthMethods().logout(),
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
