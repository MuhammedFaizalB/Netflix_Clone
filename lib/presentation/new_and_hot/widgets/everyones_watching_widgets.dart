import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widgets.dart';
import 'package:netflix_clone/presentation/widgets/video_widgets.dart';

class EveryonesWatchingWidgets extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;

  const EveryonesWatchingWidgets({
    super.key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        Text(
          movieName,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        Text(
          description,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        kHeight50,
        VideoWidgets(
          image: posterPath,
        ),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButtonWidgets(
              icon: Icons.share,
              title: "Share",
              fontSize: 14,
              iconSize: 22,
            ),
            kWidth,
            CustomButtonWidgets(
              icon: Icons.add,
              title: "My List",
              fontSize: 14,
              iconSize: 22,
            ),
            kWidth,
            CustomButtonWidgets(
              icon: Icons.play_arrow,
              title: "Play",
              fontSize: 14,
              iconSize: 22,
            ),
            kWidth,
          ],
        )
      ],
    );
  }
}
