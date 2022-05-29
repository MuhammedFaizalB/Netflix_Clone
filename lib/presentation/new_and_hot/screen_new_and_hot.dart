import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/coming_soon_widgets.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/everyones_watching_widgets.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
              title: const Text(
                "New & Hot",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
              actions: [
                const Icon(
                  Icons.cast,
                  color: Colors.white,
                ),
                kWidth,
                Container(
                  height: 30,
                  width: 30,
                  color: Colors.blue,
                ),
                kWidth
              ],
              bottom: TabBar(
                  unselectedLabelColor: kwhitecolour,
                  labelColor: kblackcolour,
                  labelStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  isScrollable: true,
                  indicator: BoxDecoration(
                    borderRadius: kRadius30,
                    color: kwhitecolour,
                  ),
                  tabs: const [
                    Tab(
                      text: "🍿 Coming Soon",
                    ),
                    Tab(
                      text: "👀 Everyone's Watching",
                    )
                  ]),
            ),
          ),
          body: TabBarView(children: [
            _buildComingSoon(),
            _buildEveryonesWatching(),
          ])),
    );
  }

  _buildComingSoon() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const ComingSoonWidgets();
      },
    );
  }

  _buildEveryonesWatching() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: ((context, index) {
        return const EveryonesWatchingWidgets();
      }),
    );
  }
}
