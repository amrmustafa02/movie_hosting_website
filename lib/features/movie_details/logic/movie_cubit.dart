import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_deep_link/core/models/movie_details_body.dart';
import 'package:movie_deep_link/core/services/api/api_service.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());

  getMovieDetails(String id) async {
    try {
      var data = await ApiService.getMovieDeatials(id);
      emit(MovieLoaded(movieDetails: MovieDetailsBody.fromJson(data)));
    } catch (_) {
      emit(MovieError(message: 'SomeThing wrong'));
    }
  }
}
