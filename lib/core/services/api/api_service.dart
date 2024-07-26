import 'package:dio/dio.dart';

import 'api_constents.dart';

class ApiService {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstents.baseUrl!,
    ),
  );
  static dynamic getMovies() async {
    var res = await dio.get(
      ApiConstents.popularEndPoint,
      options: Options(
        headers: {
          'Authorization': ApiConstents.apiKey,
        },
      ),
    );
    return res.data;
  }

  static getMovieDeatials(String id) async {
    var res = await dio.get(
      "/$id",
      options: Options(
        headers: {
          'Authorization': ApiConstents.apiKey,
        },
      ),
    );
    return res.data;
  }
}
