import 'package:flutter/material.dart';

import 'package:netflix_clone/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_clone/presentation/widgets/list_of_movie.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: const [
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
          ),
        ),
      ),
    );
  }
}
