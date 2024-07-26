import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_deep_link/features/home/logic/home_cubit.dart';
import 'package:movie_deep_link/features/movie_details/logic/movie_cubit.dart';
import 'package:movie_deep_link/features/movie_details/ui/pages/movie_details.dart';

import '../../features/home/ui/pages/home_page.dart';

class AppRouter {
  AppRouter._();
  static GoRouter getRouter() {
    return GoRouter(
      initialLocation: "/",
      routes: [
        GoRoute(
          path: '/',
          name: "'/',",
          builder: (context, state) => BlocProvider(
            create: (context) => HomeCubit()..getMovies(),
            child: const HomePage(),
          ),
        ),
        GoRoute(
            path: "/details/:movieId",
            name: "/details/:movieId",
            builder: (context, state) {
              var movieId = state.pathParameters['movieId'];

              final isDeepLink =
                  state.uri.queryParameters['deepLink'] == 'true';

              return BlocProvider(
                create: (context) =>
                    MovieCubit()..getMovieDetails(movieId ?? ""),
                child: MovieDetailsPage(isDeepLink: isDeepLink),
              );
            })
      ],
    );
  }

  static final routerDelegate = BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(
      routes: {
        // Return either Widgets or BeamPages if more customization is needed
        '/': (context, state, data) => BeamPage(
          title: "Home",
        
          child: BlocProvider(
              create: (context) => HomeCubit()..getMovies(),
              child: const HomePage(),
            ),
        ),
       
        '/details/:movieId': (context, state, data) {
          var movieId = state.pathParameters['movieId'];
           print("movieId: $movieId");
          return BeamPage(
            title: "Movie Details",
            child: BlocProvider(
              create: (context) => MovieCubit()..getMovieDetails(movieId ?? ""),
              child: const MovieDetailsPage(isDeepLink: false),
            ),
          );
        }
      },
    ).call,
  );
}
