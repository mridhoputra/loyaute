import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loyaute/utils/colors.dart';

class HomeMerchants extends StatelessWidget {
  const HomeMerchants({super.key});

  Widget _buildMerchantMenu(String image, String name) {
    return InkWell(
      onTap: () => Fluttertoast.showToast(msg: name, toastLength: Toast.LENGTH_SHORT),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(64),
            child: Image.asset(
              image,
              height: 64,
              width: 64,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(
              fontSize: 12,
              letterSpacing: -0.01,
              color: ColorTheme.body,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Popular Merchant',
                style: TextStyle(
                  height: 1,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  letterSpacing: -0.01,
                  color: ColorTheme.body,
                ),
              ),
              InkWell(
                onTap: () =>
                    Fluttertoast.showToast(msg: 'View More Page', toastLength: Toast.LENGTH_SHORT),
                child: Text(
                  'View More',
                  style: TextStyle(
                    height: 1,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: ColorTheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(width: 24),
              _buildMerchantMenu('assets/images/il_merchant_1.png', 'Pizza Hut'),
              const SizedBox(width: 8),
              _buildMerchantMenu('assets/images/il_merchant_2.png', 'Starbucks'),
              const SizedBox(width: 8),
              _buildMerchantMenu('assets/images/il_merchant_3.png', "McDonald's"),
              const SizedBox(width: 8),
              _buildMerchantMenu('assets/images/il_merchant_4.png', "Domino's Pizza"),
              const SizedBox(width: 8),
              _buildMerchantMenu('assets/images/il_merchant_5.png', 'KFC'),
              const SizedBox(width: 24),
            ],
          ),
        )
      ],
    );
  }
}
