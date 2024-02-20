import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loyaute/pages/on_boarding/on_boarding_page.dart';

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
