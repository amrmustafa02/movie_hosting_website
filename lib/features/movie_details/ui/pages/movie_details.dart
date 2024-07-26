import 'package:beamer/beamer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glass/glass.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../logic/movie_cubit.dart';

class MovieDetailsPage extends StatelessWidget {
  final bool? isDeepLink;
  const MovieDetailsPage({super.key, this.isDeepLink});

  @override
  Widget build(BuildContext context) {
    debugPrint("isDeepLink: $isDeepLink");
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        if (state is MovieInitial) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is MovieError) {
          return const Scaffold(
            body: Center(
              child: Text(
                'Error',
                style: TextStyle(color: Colors.red),
              ),
            ),
          );
        }

        if (state is MovieLoaded) {
          var width = MediaQuery.of(context).size.width;
          var height = MediaQuery.of(context).size.height;
          return Scaffold(
            appBar: AppBar(
              leading: const SizedBox.shrink(),
              leadingWidth: 0,
              title: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Color(0xFF211F30),
                  ),
                  onPressed: () {
                    if (isDeepLink == true) {
                      context.go('/home');
                      return;
                    }
                    Beamer.of(context).beamBack();
                  },
                ).asGlass(),
              ),
              actions: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: IconButton(
                    icon: const Icon(
                      Icons.share,
                      color: Color(0xFF211F30),
                    ),
                    onPressed: () {},
                  ).asGlass(),
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
              backgroundColor: Colors.transparent,
            ),
            extendBodyBehindAppBar: true,
            body: Center(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    fit: BoxFit.cover,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        Center(
                      child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                      ),
                    ),
                    imageUrl:
                        "https://image.tmdb.org/t/p/original${state.movieDetails.posterPath!}",
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        width: width,
                        height: height * .45,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 20,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                state.movieDetails.title!,
                                style: GoogleFonts.pacifico(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                              const Divider(),
                              Text(
                                state.movieDetails.overview!,
                                style: GoogleFonts.cabin(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ).asGlass(
                        blurX: 10,
                        blurY: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return const Scaffold();
      },
    );
  }
}
