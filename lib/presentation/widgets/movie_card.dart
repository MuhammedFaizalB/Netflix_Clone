import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class MovieCard extends StatelessWidget {
  final String imageUrl;
  const MovieCard({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        height: 200,
        width: 130,
        decoration: BoxDecoration(
          borderRadius: kRadius10,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
              imageUrl,
            ),
          ),
        ),
      ),
    );
  }
}
