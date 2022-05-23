import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

const imageurl =
    "https://www.themoviedb.org/t/p/w250_and_h141_face/56v2KjBlU4XaOv9rVYEQypROD7P.jpg";

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: "Top Searches",
        ),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (ctx, index) => const TopSearchMovies(),
            separatorBuilder: (ctx, index) => kHeight,
            itemCount: 10,
          ),
        )
      ],
    );
  }
}

class TopSearchMovies extends StatelessWidget {
  const TopSearchMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          height: 75,
          width: screenwidth * 0.35,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                imageurl,
              ),
            ),
          ),
        ),
        const Expanded(
            child: Text(
          "Movie Name",
          style: TextStyle(
            color: kwhitecolour,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        )),
        const CircleAvatar(
          backgroundColor: kwhitecolour,
          radius: 28,
          child: CircleAvatar(
            backgroundColor: kblackcolour,
            radius: 26,
            child: Icon(
              CupertinoIcons.play_fill,
              color: kwhitecolour,
            ),
          ),
        )
      ],
    );
  }
}
