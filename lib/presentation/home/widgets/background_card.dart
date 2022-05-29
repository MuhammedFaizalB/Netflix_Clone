import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widgets.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 600,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(kmainimage),
            ),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButtonWidgets(
                  title: "My List",
                  icon: Icons.add,
                ),
                _playbutton(),
                CustomButtonWidgets(
                  icon: Icons.info,
                  title: "Info",
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton _playbutton() {
    return TextButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kwhitecolour),
      ),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        size: 25,
        color: kblackcolour,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          "Play",
          style: TextStyle(
            color: kblackcolour,
          ),
        ),
      ),
    );
  }
}
