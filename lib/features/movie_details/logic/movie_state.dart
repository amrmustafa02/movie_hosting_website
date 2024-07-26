part of 'movie_cubit.dart';

@immutable
abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final MovieDetailsBody movieDetails;
  MovieLoaded({required this.movieDetails});
}

class MovieError extends MovieState {
  final String message;
  MovieError({required this.message});
}