import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:loyaute/model/voucher_model.dart';
import 'package:loyaute/utils/colors.dart';

class VoucherDetailPage extends StatelessWidget {
  static const routeName = '/voucher-detail';

  final Voucher voucher;

  const VoucherDetailPage({super.key, required this.voucher});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 3, bottom: 27, left: 24, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.chevron_left_rounded,
                        size: 24,
                        color: ColorTheme.neutral500,
                      ),
                      Text(
                        'Voucher Detail',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.01,
                          color: ColorTheme.body,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 24, width: 24)
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Image.asset(
                      voucher.banner,
                      height: 234,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 210),
                      padding: const EdgeInsets.all(24),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                voucher.merchantImage,
                                height: 24,
                                width: 24,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                voucher.merchantName,
                                style: TextStyle(
                                  height: 1,
                                  fontSize: 16,
                                  letterSpacing: -0.01,
                                  color: ColorTheme.body,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            voucher.title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: ColorTheme.body,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 1,
                            color: const Color(0xFFE9E9E9),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/icon_history.png', height: 22, width: 22),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Expiry Date',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.01,
                                        color: ColorTheme.border,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      '${DateFormat('dd MMMM yyyy').format(voucher.startDate)} - ${DateFormat('dd MMMM yyyy').format(voucher.endDate)}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        letterSpacing: -0.01,
                                        color: ColorTheme.body,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            voucher.description,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 14,
                              letterSpacing: -0.01,
                              color: ColorTheme.body,
                            ),
                          ),
                          const SizedBox(height: 32),
                          Image.asset('assets/images/dashed_border.png'),
                          const SizedBox(height: 32),
                          Text(
                            'Benefits',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.01,
                              color: ColorTheme.body,
                            ),
                          ),
                          const SizedBox(height: 7),
                          Column(
                            children: voucher.benefits.map((benefit) {
                              return Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 3),
                                        width: 6,
                                        height: 6,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              '${benefit.title}:',
                                              style: TextStyle(
                                                height: 1,
                                                fontSize: 14,
                                                letterSpacing: -0.01,
                                                color: ColorTheme.body,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              benefit.description,
                                              style: TextStyle(
                                                fontSize: 14,
                                                letterSpacing: -0.01,
                                                color: ColorTheme.body,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 23),
                                ],
                              );
                            }).toList(),
                          ),
                          Text(
                            'How to Get',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.01,
                              color: ColorTheme.body,
                            ),
                          ),
                          const SizedBox(height: 7),
                          Column(
                            children: voucher.howToGet.asMap().entries.map((howToGet) {
                              return Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${howToGet.key + 1}. ',
                                        style: const TextStyle(
                                          height: 1,
                                          fontSize: 14,
                                          color: Colors.black,
                                          letterSpacing: -0.01,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              '${howToGet.value.title}:',
                                              style: TextStyle(
                                                height: 1,
                                                fontSize: 14,
                                                letterSpacing: -0.01,
                                                color: ColorTheme.body,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              howToGet.value.description,
                                              style: TextStyle(
                                                fontSize: 14,
                                                letterSpacing: -0.01,
                                                color: ColorTheme.body,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 23),
                                ],
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
