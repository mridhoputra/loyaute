import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:loyaute/model/voucher_model.dart';
import 'package:loyaute/utils/colors.dart';
import 'package:loyaute/utils/data_common.dart';

typedef OnPressed = void Function(int index);

class HomePromos extends StatefulWidget {
  final List<Voucher> voucherList;
  final OnPressed onVoucherPressed;
  const HomePromos({super.key, required this.voucherList, required this.onVoucherPressed});

  @override
  State<HomePromos> createState() => _HomePromosState();
}

class _HomePromosState extends State<HomePromos> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Latest Promo',
            style: TextStyle(
              fontSize: 16,
              letterSpacing: -0.01,
              color: ColorTheme.body,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 184,
          width: MediaQuery.of(context).size.width,
          child: CarouselSlider.builder(
            carouselController: _controller,
            itemCount: widget.voucherList.length,
            itemBuilder: (context, index, realIndex) {
              return InkWell(
                onTap: () => widget.onVoucherPressed(index),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    widget.voucherList[index].banner,
                    height: 184,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              );
            },
            options: CarouselOptions(
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: voucherList.asMap().entries.map((voucher) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(voucher.key),
              child: Container(
                width: _current == voucher.key ? 22 : 6,
                height: 6,
                margin: const EdgeInsets.fromLTRB(4, 16, 4, 0),
                decoration: BoxDecoration(
                  shape: _current == voucher.key ? BoxShape.rectangle : BoxShape.circle,
                  color: _current == voucher.key ? ColorTheme.primary : const Color(0xFFD8D8D8),
                  borderRadius: _current == voucher.key ? BorderRadius.circular(22) : null,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
