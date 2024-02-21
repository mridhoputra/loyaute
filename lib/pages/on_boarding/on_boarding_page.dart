import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:loyaute/pages/auth/sign_in_page.dart';
import 'package:loyaute/pages/auth/sign_up_page.dart';
import 'package:loyaute/utils/colors.dart';

class OnBoardingPage extends StatelessWidget {
  static const routeName = '/on-boarding';
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: ColorTheme.primary,
      ),
      child: Scaffold(
        backgroundColor: ColorTheme.primary,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50, bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 26.5,
                      height: 26.5,
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'Loyauté',
                      style: TextStyle(
                        fontSize: 24,
                        letterSpacing: -0.01,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 24),
                child: Image.asset(
                  'assets/images/il_onboarding.png',
                  width: MediaQuery.of(context).size.height > 700
                      ? MediaQuery.of(context).size.width - 43 - 43
                      : MediaQuery.of(context).size.width * 0.72,
                  fit: BoxFit.fitWidth,
                ),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to Loyauté!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      letterSpacing: -0.01,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Swipe, shop, and smile!\nYour loyalty journey starts here.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: -0.01,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () => context.pushNamed(SignInPage.routeName),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Sign In',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorTheme.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    letterSpacing: -0.01,
                    fontSize: 14,
                  ),
                  children: [
                    const TextSpan(
                      text: "Haven't registered yet? ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: 'Sign Up',
                      style: const TextStyle(
                        color: Color(0xFF00366C),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => context.pushNamed(SignUpPage.routeName),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
