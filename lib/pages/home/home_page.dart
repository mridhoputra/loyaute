import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:loyaute/pages/home/widgets/home_menu.dart';
import 'package:loyaute/provider/user_provider.dart';
import 'package:loyaute/utils/colors.dart';
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
                Consumer<UserProvider>(
                  builder: (context, userProvider, child) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 32, bottom: 24),
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
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: -0.01),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () => Fluttertoast.showToast(
                                          msg: 'Search Icon', toastLength: Toast.LENGTH_SHORT),
                                      child: Image.asset(
                                        'assets/images/icon_search.png',
                                        height: 24,
                                        width: 23,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    InkWell(
                                      onTap: () => Fluttertoast.showToast(
                                          msg: 'Notif Icon', toastLength: Toast.LENGTH_SHORT),
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
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 182,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: ColorTheme.primary,
                                  borderRadius: BorderRadius.circular(16),
                                  image: const DecorationImage(
                                    image: AssetImage('assets/images/pattern_home_membership.png'),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 22),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Balance',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300,
                                              letterSpacing: -0.01,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Image.asset(
                                            'assets/images/logo_white.png',
                                            height: 20,
                                            width: 20,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 2),
                                      RichText(
                                        text: TextSpan(
                                          style: const TextStyle(
                                            letterSpacing: -0.01,
                                            fontSize: 24,
                                            color: Colors.white,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: NumberFormat('#,###')
                                                  .format(userProvider.user.point)
                                                  .toString(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const TextSpan(
                                              text: ' Points',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      RichText(
                                        text: TextSpan(
                                          style: const TextStyle(
                                            letterSpacing: -0.01,
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                          children: [
                                            const TextSpan(
                                              text: 'Expiration date: ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            TextSpan(
                                              text: DateFormat('MMM d, yyyy').format(
                                                userProvider.user.pointExpiry ?? DateTime.now(),
                                              ),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 122, left: 22, right: 22),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 16,
                                        horizontal: 32,
                                      ),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          topRight: Radius.circular(16),
                                        ),
                                      ),
                                      child: BarcodeWidget(
                                        data: userProvider.user.memberId ?? '-',
                                        barcode: Barcode.code128(),
                                        height: 52,
                                        drawText: false,
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(16),
                                          bottomRight: Radius.circular(16),
                                        ),
                                      ),
                                      child: Text(
                                        userProvider.user.memberId ?? '-',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          letterSpacing: 0.41,
                                          color: Colors.white,
                                          fontFamily: 'OCRAExtended',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 40, bottom: 32),
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
                        ],
                      ),
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
