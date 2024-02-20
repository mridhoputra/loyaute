import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  static const routeName = '/on-boarding';
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Text('On Boarding'),
      ),
    );
  }
}
