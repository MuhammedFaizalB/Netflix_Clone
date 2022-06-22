import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/downloads/downloads_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/widgets/app_bar_widgets.dart';

class ScreenDownload extends StatelessWidget {
  ScreenDownload({Key? key}) : super(key: key);

  final _widgetList = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidgets(
              title: "Downloads",
            ),
          ),
          body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (ctx, index) {
              return _widgetList[index];
            },
            separatorBuilder: (ctx, index) {
              return const SizedBox(
                height: 25,
              );
            },
            itemCount: _widgetList.length,
          )),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadEvent.getDownloadsImage());
    });

    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          "Introducing Download for You",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kwhitecolour,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        const Text(
          "We\"ll download a personalised selection of\n movies and shows for you, so there's \nalways something to watch on your \ndevice.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        kHeight,
        BlocBuilder<DownloadsBloc, DownloadState>(
          builder: (context, state) {
            return SizedBox(
              height: size.width,
              width: size.width,
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: size.width * 0.35,
                          backgroundColor: Colors.grey.withOpacity(0.6),
                        ),
                        DownloadsImageWidgets(
                          imagelist:
                              "$imageAppendUrl${state.downloads[0].posterPath}",
                          margin: const EdgeInsets.only(left: 150, bottom: 20),
                          angle: 15,
                        ),
                        DownloadsImageWidgets(
                          imagelist:
                              "$imageAppendUrl${state.downloads[1].posterPath}",
                          margin: const EdgeInsets.only(right: 150, bottom: 20),
                          angle: -15,
                        ),
                        DownloadsImageWidgets(
                          imagelist:
                              "$imageAppendUrl${state.downloads[2].posterPath}",
                          margin: const EdgeInsets.only(bottom: 20),
                        ),
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kbuttonblue,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Set Up",
                style: TextStyle(
                  color: kbuttonwhite,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          color: kbuttonwhite,
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "See what you can download",
              style: TextStyle(
                  color: kblackcolour,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kWidth,
        Icon(
          Icons.settings,
          color: kwhitecolour,
        ),
        kWidth,
        Text("Smart Download"),
      ],
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
        height: size.width * 0.5,
        width: size.width * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
              imagelist,
            ),
          ),
        ),
      ),
    );
  }
}
