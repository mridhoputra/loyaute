import 'package:loyaute/provider/user_provider.dart';
import 'package:loyaute/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Loyaute',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'PlusJakartaSans',
        ),
      ),
    );
  }
}
