import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              height: 150,
              width: 50,
            ),
            Container(
              height: 200,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: kRadius10,
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    "https://www.themoviedb.org/t/p/w220_and_h330_face/ekZobS8isE6mA53RAiGDG93hBxL.jpg",
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 20,
          top: 80,
          child: BorderedText(
            strokeWidth: 5,
            strokeColor: Colors.white,
            child: Text(
              "${index + 1}",
              style: TextStyle(
                fontSize: 120,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        )
      ],
    );
  }
}
