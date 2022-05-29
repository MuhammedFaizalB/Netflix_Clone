import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widgets.dart';
import 'package:netflix_clone/presentation/widgets/video_widgets.dart';

class EveryonesWatchingWidgets extends StatelessWidget {
  const EveryonesWatchingWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        const Text(
          "Stranger Things",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        const Text(
          "When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        kHeight50,
        const VideoWidgets(
          image: tempEveryonesWatchingimage,
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
