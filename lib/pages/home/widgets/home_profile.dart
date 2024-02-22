import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loyaute/provider/user_provider.dart';

typedef OnTap = void Function();

class HomeProfile extends StatelessWidget {
  final UserProvider userProvider;
  final OnTap onSearchPressed;
  final OnTap onNotifPressed;
  const HomeProfile({
    super.key,
    required this.userProvider,
    required this.onSearchPressed,
    required this.onNotifPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/img_sample.png',
              width: 48,
              height: 48,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Good morning,',
                  style: TextStyle(fontSize: 10, letterSpacing: -0.01),
                ),
                const SizedBox(height: 2),
                Text(
                  userProvider.user.name ?? '-',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700, letterSpacing: -0.01),
                ),
              ],
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: onSearchPressed,
                child: Image.asset(
                  'assets/images/icon_search.png',
                  height: 24,
                  width: 23,
                ),
              ),
              const SizedBox(width: 16),
              InkWell(
                onTap: onNotifPressed,
                child: Image.asset(
                  'assets/images/icon_notif.png',
                  height: 24,
                  width: 23,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
