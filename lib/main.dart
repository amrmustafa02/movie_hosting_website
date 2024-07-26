import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_deep_link/core/services/api/api_constents.dart';
import 'package:movie_deep_link/movie_app.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setPathUrlStrategy();

  await dotenv.load(fileName: 'assets/dot.env');
  
  ApiConstents.init();

  runApp( MovieApp());
}
