import 'package:flutter/material.dart';
import 'package:loyaute/utils/colors.dart';

typedef OnTap = void Function();

class HomeMenu extends StatelessWidget {
  final OnTap onTap;
  final String title;
  final String image;
  const HomeMenu({super.key, required this.onTap, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorTheme.primary,
            ),
            child: Image.asset(
              image,
              height: 24,
              width: 24,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.01,
              color: ColorTheme.body,
            ),
          )
        ],
      ),
    );
  }
}
