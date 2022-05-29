import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widgets.dart';
import 'package:netflix_clone/presentation/widgets/video_widgets.dart';

class ComingSoonWidgets extends StatelessWidget {
  const ComingSoonWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                "FEB",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              Text(
                "11",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VideoWidgets(image: tempComingSoonImage),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Rescue Rangers",
                    style: TextStyle(
                      letterSpacing: -3,
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      CustomButtonWidgets(
                        icon: Icons.notifications,
                        title: "Remind Me",
                        fontSize: 14,
                        iconSize: 24,
                      ),
                      kWidth,
                      CustomButtonWidgets(
                        icon: Icons.info,
                        title: "Info",
                        fontSize: 14,
                        iconSize: 24,
                      ),
                      kWidth
                    ],
                  ),
                ],
              ),
              kHeight,
              const Text("Coming on Sunday"),
              kHeight,
              const Text(
                "Rescue Rangers",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Decades after their successful television series was canceled, Chip and Dale must repair their broken friendship and take on their Rescue Rangers detective personas once again when a former cast mate mysteriously disappears.",
                style: TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
