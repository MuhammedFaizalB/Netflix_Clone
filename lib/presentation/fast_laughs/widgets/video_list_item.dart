import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class VideoListItem extends StatelessWidget {
  final index;
  const VideoListItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            // left Side
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  radius: 30,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off,
                      color: kwhitecolour,
                      size: 30,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            "https://www.themoviedb.org/t/p/w220_and_h330_face/sKCr78MXSLixwmZ8DyJLrpMsd15.jpg"),
                      ),
                    ),
                    VideoActioWidgets(icon: Icons.emoji_emotions, title: "LOL"),
                    VideoActioWidgets(icon: Icons.add, title: "My List"),
                    VideoActioWidgets(icon: Icons.share, title: "Share"),
                    VideoActioWidgets(icon: Icons.play_arrow, title: "Play")
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class VideoActioWidgets extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActioWidgets({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: kwhitecolour,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(
              color: kwhitecolour,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
