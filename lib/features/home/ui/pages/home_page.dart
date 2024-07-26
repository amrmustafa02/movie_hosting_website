import 'package:beamer/beamer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_deep_link/features/home/logic/home_cubit.dart';
import 'package:movie_deep_link/features/home/logic/home_state.dart';
import 'package:movie_deep_link/features/home/ui/widgets/movie_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeCubitState>(
      builder: (context, state) {
        if (state is HomeCubitInitial) {
          return Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is HomeErrorState) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text(state.message),
            ),
          );
        }

        if (state is HomeSuccessState) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: CarouselSlider(
                items: state.movies
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          // context.push("/details/${e.id}");
                          context.beamToNamed('/details/${e.id}');

                        },
                        child: MovieItem(
                          title: e.title!,
                          overview: e.voteAverage.toString().substring(0, 1),
                          imageUrl: e.posterPath!,
                        ),
                      ),
                    )
                    .toList(),
                options: options(),
              ),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(),
          body: const Center(
            child: Text("Error"),
          ),
        );
      },
    );
  }

  CarouselOptions options() {
    return CarouselOptions(
      height: 500,
      aspectRatio: 16 / 9,
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayAnimationDuration: const Duration(seconds: 2),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      enlargeFactor: 0.2,
      onPageChanged: (index, reason) {},
      scrollDirection: Axis.horizontal,
    );
  }
}
