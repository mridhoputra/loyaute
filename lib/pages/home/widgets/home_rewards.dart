import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loyaute/utils/colors.dart';

class HomeRewards extends StatelessWidget {
  const HomeRewards({super.key});

  Widget _buildRewardsFilter(String image, String name) {
    return InkWell(
      onTap: () => Fluttertoast.showToast(msg: name, toastLength: Toast.LENGTH_SHORT),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F7FB),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            if (image != '')
              Container(
                margin: const EdgeInsets.only(right: 4),
                child: Image.asset(
                  image,
                  height: 18,
                  width: 18,
                ),
              ),
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
      ),
    );
  }

  Widget _buildRewardsMenu({
    required String bannerImage,
    required String merchantImage,
    required String merchantName,
    required String bannerTitle,
    required String pointValue,
  }) {
    return InkWell(
      onTap: () => Fluttertoast.showToast(msg: bannerTitle, toastLength: Toast.LENGTH_SHORT),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              bannerImage,
              height: 158,
              width: 158,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  merchantImage,
                  height: 16,
                  width: 16,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                merchantName,
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: -0.01,
                  color: ColorTheme.body,
                  height: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            bannerTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Point earned',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF979797),
            ),
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/logo_yellow.png',
                height: 15,
                width: 15,
              ),
              const SizedBox(width: 6),
              Text(
                pointValue,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorTheme.body,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
              _buildRewardsFilter('', 'All'),
              const SizedBox(width: 8),
              _buildRewardsFilter('assets/images/icon_food.png', 'Food'),
              const SizedBox(width: 8),
              _buildRewardsFilter('assets/images/icon_groceries.png', 'Groceries'),
              const SizedBox(width: 8),
              _buildRewardsFilter('assets/images/icon_beverages.png', "Beverages"),
              const SizedBox(width: 24),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 13,
            crossAxisSpacing: 13,
            childAspectRatio: 0.65,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildRewardsMenu(
                bannerImage: 'assets/images/il_rewards_1.png',
                merchantImage: 'assets/images/il_merchant_2.png',
                merchantName: 'Starbucks',
                bannerTitle: 'Monday Mood Booster Starbucks',
                pointValue: '250',
              ),
              _buildRewardsMenu(
                bannerImage: 'assets/images/il_rewards_2.png',
                merchantImage: 'assets/images/il_merchant_5.png',
                merchantName: 'KFC',
                bannerTitle: 'KFC Value Serbu',
                pointValue: '172',
              ),
              _buildRewardsMenu(
                bannerImage: 'assets/images/il_rewards_3.png',
                merchantImage: 'assets/images/il_merchant_6.png',
                merchantName: 'Segari',
                bannerTitle: 'Poromo PASTISEGAR',
                pointValue: '104',
              ),
              _buildRewardsMenu(
                bannerImage: 'assets/images/il_rewards_4.png',
                merchantImage: 'assets/images/il_merchant_4.png',
                merchantName: "Domino's Pizza",
                bannerTitle: "Domino’s: All i want for Christmas",
                pointValue: '53',
              ),
              _buildRewardsMenu(
                bannerImage: 'assets/images/il_rewards_5.png',
                merchantImage: 'assets/images/il_merchant_7.png',
                merchantName: 'HokBen',
                bannerTitle: 'HokBen: Pay Day',
                pointValue: '147',
              ),
              _buildRewardsMenu(
                bannerImage: 'assets/images/il_rewards_6.png',
                merchantImage: 'assets/images/il_merchant_8.png',
                merchantName: 'Matahari',
                bannerTitle: 'Weekend SALE!',
                pointValue: '74',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
