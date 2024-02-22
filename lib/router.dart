import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loyaute/pages/auth/otp_page.dart';
import 'package:loyaute/pages/auth/sign_in_page.dart';
import 'package:loyaute/pages/auth/sign_up_page.dart';
import 'package:loyaute/pages/home/home_page.dart';
import 'package:loyaute/pages/on_boarding/on_boarding_page.dart';
import 'package:loyaute/widgets/bottom_nav.dart';

final router = GoRouter(
  initialLocation: OnBoardingPage.routeName,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      name: OnBoardingPage.routeName,
      path: OnBoardingPage.routeName,
      pageBuilder: (context, state) {
        return buildCustomTransitionPage(
          state: state,
          context: context,
          child: const OnBoardingPage(),
        );
      },
    ),
    GoRoute(
      name: SignInPage.routeName,
      path: SignInPage.routeName,
      pageBuilder: (context, state) {
        return buildCustomTransitionPage(
          state: state,
          context: context,
          child: const SignInPage(),
        );
      },
    ),
    GoRoute(
      name: SignUpPage.routeName,
      path: SignUpPage.routeName,
      pageBuilder: (context, state) {
        return buildCustomTransitionPage(
          state: state,
          context: context,
          child: const SignUpPage(),
        );
      },
    ),
    GoRoute(
      name: OTPPage.routeName,
      path: OTPPage.routeName,
      pageBuilder: (context, state) {
        return buildCustomTransitionPage(
          state: state,
          context: context,
          child: const OTPPage(),
        );
      },
    ),
    ShellRoute(
      builder: (context, state, child) {
        return BottomNav(child: child);
      },
      routes: [
        GoRoute(
          name: HomePage.routeName,
          path: HomePage.routeName,
          pageBuilder: (context, state) {
            return buildCustomTransitionPage(
              state: state,
              context: context,
              child: const HomePage(),
            );
          },
        ),
      ],
    ),
  ],
);

CustomTransitionPage buildCustomTransitionPage({context, state, child}) {
  return CustomTransitionPage(
    child: child,
    transitionDuration: const Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
