import 'package:fantasy_football/widgets/player_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/is_selected_player.dart';
import '../../other/lists.dart';
import '../service/hive_service/selection_section.dart';

class SelectionCapitan extends StatefulWidget {
  const SelectionCapitan({super.key});

  @override
  State<StatefulWidget> createState() => _SelectionCapitanState();
}

class _SelectionCapitanState extends State<SelectionCapitan> {
  IsSelectedPlayer selected = Get.put(IsSelectedPlayer());
  int selectedCaptainIndex = -1; // -1 indicates no captain selected
int _selectedIndex =0;
  String section = SelectionSection.getSection() ?? "1-3-4-3";

  @override
  void initState() {
    super.initState();

    check();
  }
  void check() {
    setState(() {
      if (section == teamSection[1]) {
        _selectedIndex = 1;
      } else if (section == teamSection[2]) {
        _selectedIndex = 2;
      } else if (section == teamSection[3]) {
        _selectedIndex = 3;
      }
    });
  }
  void selectCapitan(int index) {
    setState(() {
      selectedCaptainIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          "Kapitanni tanlang",
          style: TextStyle(fontSize: 25),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Color(0xff1F9059),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
          ),
          margin: EdgeInsets.symmetric(horizontal: 12),
          width: 433,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Text(
                  section,
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
        _buildStack(),
        if (selectedCaptainIndex != -1) // Only show captain info if selected
          _buildCaptainInfo(selectedCaptainIndex),
      ],
    );
  }

  Widget _buildStack() {
    return Stack(
      children: [
        Image.asset(
          height: 433,
          "assets/images/football_field.png",
          width: double.infinity,
        ),
        //...playerPositions,
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 55,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Player(
                  onPress: () => selectCapitan(0),
                  index: 0,
                ),
              ],
            ),
            SizedBox(
              height: 55,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Player(
                  onPress: () => selectCapitan(1),
                  index: 1,
                ),
                Player(
                  onPress: () => selectCapitan(2),
                  index: 2,
                ),
                Player(
                  onPress: () => selectCapitan(3),
                  index: 3,
                ),
              ],
            ),
            SizedBox(
              height: 55,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Player(
                  onPress: () => selectCapitan(4),
                  index: 4,
                ),
                Player(
                  onPress: () => selectCapitan(5),
                  index: 5,
                ),
                Player(
                  onPress: () => selectCapitan(6),
                  index: 6,
                ),
                Player(
                  onPress: () => selectCapitan(7),
                  index: 7,
                ),
                Player(
                  onPress: () => selectCapitan(8),
                  index: 8,
                ),
              ],
            ),
            SizedBox(
              height: 55,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Player(
                  onPress: () => selectCapitan(10),
                  index: 10,
                ),
                // Player(
                //   onPress: () => selectCapitan(11),
                //   index: 2,
                // ),

              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCaptainInfo(int captainIndex) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        "Kapitan: ${playerNames[captainIndex]}",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}