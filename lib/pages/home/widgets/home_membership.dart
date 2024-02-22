import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loyaute/provider/user_provider.dart';
import 'package:loyaute/utils/colors.dart';

class HomeMembership extends StatelessWidget {
  final UserProvider userProvider;
  const HomeMembership({super.key, required this.userProvider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Stack(
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
                          text: NumberFormat('#,###').format(userProvider.user.point).toString(),
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
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 12.4,
                  offset: const Offset(0, 0),
                  color: Colors.black.withOpacity(0.08),
                )
              ],
            ),
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
    );
  }
}
