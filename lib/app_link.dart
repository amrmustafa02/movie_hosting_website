import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:flutter/cupertino.dart';

class AppLinksDeepLink {
  AppLinksDeepLink._privateConstructor();

  static final AppLinksDeepLink _instance =
      AppLinksDeepLink._privateConstructor();

  static AppLinksDeepLink get instance => _instance;

  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  void onInit() {
    _appLinks = AppLinks();
    initDeepLinks();
  }

  Future<void> initDeepLinks() async {
    // Check initial link if app was in cold state (terminated)
    final appLink = await _appLinks.getInitialAppLink();
    if (appLink != null) {
      var uri = Uri.parse(appLink.toString());
      var path = uri.path.split("/");
      var movieId = path.last;

      print('Movie Id : $movieId');

      // Handle link when app is in warm state (front or background)
      // go to movie details page
      
    }

    // Handle link when app is in warm state (front or background)
    _linkSubscription = _appLinks.uriLinkStream.listen(
      (uriValue) {
        print(' you will listen any url updates ');
        print(' here you can redirect from url as per your need ');
      },
      onError: (err) {
        debugPrint('====>>> error : $err');
      },
      onDone: () {
        _linkSubscription?.cancel();
      },
    );
  }
}
