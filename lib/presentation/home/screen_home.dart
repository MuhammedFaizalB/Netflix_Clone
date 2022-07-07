import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/home/home_bloc.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/background_card.dart';

import 'package:netflix_clone/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_clone/presentation/widgets/list_of_movie.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: ((notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            }),
            child: SafeArea(
              child: Stack(
                children: [
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        );
                      } else if (state.hasError) {
                        return const Center(
                          child: Text("Error While Getting Data"),
                        );
                      }
                      // releasedPastYear
                      final _releasePastYear = state.pastYearMovieList.map((m) {
                        return '$imageAppendUrl${m.posterPath}';
                      }).toList();
                      _releasePastYear.shuffle();

                      // trending
                      final _trending = state.trendingMovieList.map((m) {
                        return '$imageAppendUrl${m.posterPath}';
                      }).toList();
                      _trending.shuffle();

                      // tenseDramas
                      final _tenseDramas = state.tenseDramaMovieList.map((m) {
                        return '$imageAppendUrl${m.posterPath}';
                      }).toList();
                      _tenseDramas.shuffle();

                      // southIndian
                      final _southIndian = state.southIndianMovieList.map((m) {
                        return '$imageAppendUrl${m.posterPath}';
                      }).toList();
                      _southIndian.shuffle();

                      // Top 10 TV Shows
                      final _top10TvShows = state.trendingTvList.map((t) {
                        return '$imageAppendUrl${t.posterPath}';
                      }).toList();

                      //List View
                      return ListView(
                        children: [
                          const BackgroundCard(),
                          ListOfMovie(
                            title: "Released in the Past Year",
                            posterList: _releasePastYear,
                          ),
                          ListOfMovie(
                            title: "Treading Now",
                            posterList: _trending,
                          ),
                          NumberTitleCard(
                            posterList: _top10TvShows,
                          ),
                          ListOfMovie(
                            title: "Tense Dramas",
                            posterList: _tenseDramas,
                          ),
                          ListOfMovie(
                            title: "South Indian Cinemas",
                            posterList: _southIndian,
                          ),
                        ],
                      );
                    },
                  ),
                  scrollNotifier.value == true
                      ? AnimatedContainer(
                          duration: const Duration(milliseconds: 1000),
                          width: double.infinity,
                          height: 90,
                          color: Colors.black.withOpacity(0.3),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRb6XjyAxp1vFNL8a3FLgI8qh6fq81E4x-3Lw&usqp=CAU",
                                    width: 70,
                                    height: 60,
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.cast,
                                    color: Colors.white,
                                  ),
                                  kWidth,
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "TV Shows",
                                    style: kHomeTitleText,
                                  ),
                                  Text(
                                    "Movies",
                                    style: kHomeTitleText,
                                  ),
                                  Text(
                                    "Categories",
                                    style: kHomeTitleText,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      : kHeight,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
