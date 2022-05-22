import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/widgets/app_bar_widgets.dart';

class ScreenDownload extends StatelessWidget {
  ScreenDownload({Key? key}) : super(key: key);

  final imagelist = [
    "https://www.themoviedb.org/t/p/w220_and_h330_face/sI9neTbF3ECdpf2MpC88EMGJH13.jpg",
    "https://www.themoviedb.org/t/p/w220_and_h330_face/5TYgKxYhnhRNNwqnRAKHkgfqi2G.jpg",
    "https://www.themoviedb.org/t/p/w220_and_h330_face/sKCr78MXSLixwmZ8DyJLrpMsd15.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidgets(
              title: "Downloads",
            ),
          ),
          body: ListView(
            children: [
              Row(
                children: const [
                  kWidth,
                  Icon(
                    Icons.settings,
                    color: kwhitecolour,
                  ),
                  kWidth,
                  Text("Smart Download"),
                ],
              ),
              Text("Introducing Download for You"),
              Text(
                  "We\"ll download a personalised selection of movies and shows for you, so there's always something to watch on your device."),
              Container(
                height: size.width,
                width: size.width,
                color: Colors.white,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: size.width * 0.35,
                    ),
                    DownloadsImageWidgets(
                      imagelist: imagelist[0],
                      margin: EdgeInsets.only(left: 120, bottom: 20),
                      angle: 20,
                    ),
                    DownloadsImageWidgets(
                      imagelist: imagelist[1],
                      margin: EdgeInsets.only(right: 120, bottom: 20),
                      angle: -20,
                    ),
                    DownloadsImageWidgets(
                      imagelist: imagelist[2],
                      margin: EdgeInsets.only(bottom: 20),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                color: kbuttonblue,
                onPressed: () {},
                child: const Text(
                  "Set Up",
                  style: TextStyle(
                    color: kbuttonwhite,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              MaterialButton(
                color: kbuttonwhite,
                onPressed: () {},
                child: const Text(
                  "See what you can download",
                  style: TextStyle(
                      color: kblackcolour,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )),
    );
  }
}

class DownloadsImageWidgets extends StatelessWidget {
  const DownloadsImageWidgets({
    Key? key,
    required this.imagelist,
    this.angle = 0,
    required this.margin,
  }) : super(key: key);

  final String imagelist;
  final double angle;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        height: size.width * 0.58,
        width: size.width * 0.48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(
              imagelist,
            ),
          ),
        ),
      ),
    );
  }
}
