import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstents {
  static String? baseUrl;
  static String popularEndPoint = "/popular";
  static String? apiKey;

  static init() {
    baseUrl = dotenv.env['BASE_URL'];
    apiKey = dotenv.env['API_KEY'];
    debugPrint("baseUrl: $baseUrl");
    debugPrint("apiKey: $apiKey");
  }
}
