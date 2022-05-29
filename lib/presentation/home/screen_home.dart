import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/background_card.dart';

import 'package:netflix_clone/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_clone/presentation/widgets/list_of_movie.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  ListView(
                    children: const [
                      BackgroundCard(),
                      ListOfMovie(
                        title: "Released in the Past Year",
                      ),
                      ListOfMovie(
                        title: "Treading Now",
                      ),
                      NumberTitleCard(),
                      ListOfMovie(
                        title: "Tense Dramas",
                      ),
                      ListOfMovie(
                        title: "South Indian Cinemas",
                      ),
                    ],
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
