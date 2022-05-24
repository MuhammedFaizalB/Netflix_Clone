import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        height: 200,
        width: 130,
        decoration: BoxDecoration(
          borderRadius: kRadius10,
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
              "https://www.themoviedb.org/t/p/w220_and_h330_face/7qop80YfuO0BwJa1uXk1DXUUEwv.jpg",
            ),
          ),
        ),
      ),
    );
  }
}
