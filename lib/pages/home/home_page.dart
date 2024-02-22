import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:loyaute/pages/home/widgets/home_membership.dart';
import 'package:loyaute/pages/home/widgets/home_menu.dart';
import 'package:loyaute/pages/home/widgets/home_merchants.dart';
import 'package:loyaute/pages/home/widgets/home_profile.dart';
import 'package:loyaute/pages/home/widgets/home_promos.dart';
import 'package:loyaute/pages/home/widgets/home_rewards.dart';
import 'package:loyaute/provider/user_provider.dart';
import 'package:loyaute/utils/colors.dart';
import 'package:loyaute/utils/data_common.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: ColorTheme.primary,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/pattern_home_header.png',
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 9),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/logo_white.png',
                            width: 19,
                            height: 19,
                          ),
                          const Text(
                            'Loyauté',
                            style: TextStyle(
                              height: 1,
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Consumer<UserProvider>(
                  builder: (context, userProvider, child) {
                    return Column(
                      children: [
                        HomeProfile(
                          userProvider: userProvider,
                          onSearchPressed: () {
                            Fluttertoast.showToast(
                                msg: 'Search button', toastLength: Toast.LENGTH_SHORT);
                          },
                          onNotifPressed: () {
                            Fluttertoast.showToast(
                                msg: 'Notification button', toastLength: Toast.LENGTH_SHORT);
                          },
                        ),
                        const SizedBox(height: 24),
                        HomeMembership(userProvider: userProvider),
                        const SizedBox(height: 40),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HomeMenu(
                                onTap: () => Fluttertoast.showToast(
                                    msg: 'Menu Voucher', toastLength: Toast.LENGTH_SHORT),
                                title: 'Voucher',
                                image: 'assets/images/icon_voucher.png',
                              ),
                              HomeMenu(
                                onTap: () => Fluttertoast.showToast(
                                    msg: 'Menu QRIS', toastLength: Toast.LENGTH_SHORT),
                                title: 'QRIS',
                                image: 'assets/images/icon_qris.png',
                              ),
                              HomeMenu(
                                onTap: () => Fluttertoast.showToast(
                                    msg: 'Menu Scan', toastLength: Toast.LENGTH_SHORT),
                                title: 'Scan',
                                image: 'assets/images/icon_scan.png',
                              ),
                              HomeMenu(
                                onTap: () => Fluttertoast.showToast(
                                    msg: 'Menu Mission', toastLength: Toast.LENGTH_SHORT),
                                title: 'Mission',
                                image: 'assets/images/icon_mission.png',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        HomePromos(
                          voucherList: voucherList,
                          onVoucherPressed: (index) {
                            Fluttertoast.showToast(
                              msg: voucherList[index].title,
                              toastLength: Toast.LENGTH_SHORT,
                            );
                          },
                        ),
                        const SizedBox(height: 32),
                        const HomeMerchants(),
                        const SizedBox(height: 32),
                        const HomeRewards(),
                        const SizedBox(height: 32),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
