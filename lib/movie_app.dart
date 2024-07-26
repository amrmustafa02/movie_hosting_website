import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:movie_deep_link/app_link.dart';
import 'package:movie_deep_link/config/routes/app_router.dart';

class MovieApp extends StatelessWidget {
  final AppLinksDeepLink _appLinksDeepLink =
      AppLinksDeepLink.instance; // Initialize AppLinksDeepLink instance

  MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    _appLinksDeepLink
        .onInit(); // Initialize deep links when the app starts
    return MaterialApp.router(
      theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFF211F30),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF211F30),
            elevation: 0,
          )),
      // routerConfig: AppRouter.getRouter(),
      routeInformationParser: BeamerParser(),
      routerDelegate: AppRouter.routerDelegate,
      debugShowCheckedModeBanner: false,
    );
  }
}
