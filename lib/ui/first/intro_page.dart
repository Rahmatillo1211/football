import 'package:fantasy_football/api/player_service.dart';
import 'package:fantasy_football/controller/players_list.dart';
import 'package:fantasy_football/model/players_model.dart';
import 'package:fantasy_football/ui/first/assemble_team.dart';
import 'package:fantasy_football/ui/first/slection_team.dart';
import 'package:fantasy_football/widgets/intro_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/example.dart';

class BaseIntroPage extends StatefulWidget {
  static const String id = "base_intro_page";

  const BaseIntroPage({super.key});

  @override
  State<BaseIntroPage> createState() => _BaseIntroPageState();
}

class _BaseIntroPageState extends State<BaseIntroPage> {
  late PageController pageController;
  int selectedIndex = 0;

  // List<Player> data;
  PlayersList player = Get.put(PlayersList());

  void get() async {
    List<Player>? data = await PlayerService.parsingResponse2();
    Logger().i(data?[0].name);
  }

  void get2() async {
    List<Player>? data = await PlayerService.parsingResponse2();

    player.getValue(data!);
    Logger().i(data[0].name);
    Logger().i(player.playersList[0].name);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: 0);
    get();
    get2();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Spacer(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.87,
            width: MediaQuery.of(context).size.width,
            child: PageView(
              controller: pageController,
              onPageChanged: (int index) {
                setState(() {
                  index = selectedIndex;
                });
              },
              children: const [
                IntroPages(index: 0),
                IntroPages(index: 1),
                IntroPages(index: 2),
                SelectionTeam(),
                SelectionCapitan(),
                AssembleTeam()
              ],
            ),
          ),
          // Spacer(),

          SmoothPageIndicator(
              controller: pageController, // PageController
              count: 6,
              effect: const JumpingDotEffect(
                  activeDotColor: Color(0xFF10A3A3),
                  dotColor: Color(0xFFB2EBF2)), // your preferred effect
              onDotClicked: (index) {}),
          Spacer(),
        ],
      ),
    ));
  }
}
