import 'package:movie_deep_link/core/models/get_movies_body.dart';

abstract class HomeCubitState {}

class HomeCubitInitial extends HomeCubitState {}

class HomeSuccessState extends HomeCubitState {
  final List<Results> movies;
  HomeSuccessState(this.movies);
}

class HomeErrorState extends HomeCubitState {
  final String message;
  HomeErrorState(this.message);
}
