import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';
import 'package:netflix_clone/presentation/widgets/movie_card.dart';

class ListOfMovie extends StatelessWidget {
  const ListOfMovie({
    Key? key,
    required this.title,
    required this.posterList,
  }) : super(key: key);

  final String title;
  final List<String> posterList;

  @override
  Widget build(BuildContext context) {
    kHeight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        MainTitle(title: title),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) => MovieCard(
                imageUrl: posterList[index],
              ),
            ),
          ),
        )
      ],
    );
  }
}
