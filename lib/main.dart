import 'package:loyaute/router.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const Loyaute());
}

class Loyaute extends StatefulWidget {
  const Loyaute({super.key});

  @override
  State<Loyaute> createState() => _LoyauteState();
}

class _LoyauteState extends State<Loyaute> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Loyaute',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'PlusJakartaSans',
      ),
    );
  }
}
