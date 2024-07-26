import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_deep_link/core/models/get_movies_body.dart';
import 'package:movie_deep_link/core/services/api/api_service.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(HomeCubitInitial());

  Future<void> getMovies() async {
    try {
      var response = await ApiService.getMovies();
      debugPrint("response:e");
      var movies = GetMoviesBody.fromJson(response).results;
      debugPrint("after convert:");

      emit(HomeSuccessState(movies ?? []));
    } catch (_) {
      emit(HomeErrorState("Error while getting movies"));
    }
  }
}
