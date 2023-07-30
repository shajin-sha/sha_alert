import 'package:flutter/material.dart';
import 'package:sha_alert/button.dart';
import 'package:sha_alert/sha_alert.dart';

void main() {
  runApp(const ShaAlertApp());
}

class ShaAlertApp extends StatelessWidget {
  const ShaAlertApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sha Alert",
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Button(
            onPressed: () {
              ShaAlert.showHozzoAlert(
                context,
                title: "Welcome Note",
                message: "Happy to see you on board! Please read the terms and conditions carefully before proceeding further.",
                firstButtonTitle: "I Agree",
                firstButtonType: ButtonType.primary,
                secondButtonTitle: "Read Terms and Conditions",
              );
            },
            title: "Delete Account",
            primaryColor: Colors.red,
            width: 200,
            height: 50,
          ),
        ),
      ),
    );
  }
}
