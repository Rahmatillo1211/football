import 'package:fantasy_football/widgets/team_widget.dart';
import 'package:flutter/material.dart';

class AssembleTeam extends StatefulWidget {
  const AssembleTeam({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AssembleTeamState();
  }
}

class _AssembleTeamState extends State<AssembleTeam> {
  int _selectedIndex = 0;
  List<String> playerNames = [
    "Player 1",
    "Player 2",
    "Player 3",
    "Player 4",
    "Player 5",
    "Player 6",
    "Player 7",
    "Player 8",
    "Player 9",
    "Player 10",
    "Player 11",
  ];
  List<bool> playerSelected = List.generate(11, (_) => false);
  Map<int, int> selectedPlayers = {};
  int? currentSelectedPosition;

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
          "Jamoani tanlang",
          style: TextStyle(fontSize: 25),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 370,
            child: GridView.count(
              crossAxisCount: 5,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              children: const [
                TeamWidget(index: 0),
                TeamWidget(index: 1),
                TeamWidget(index: 2),
                TeamWidget(index: 3),
                TeamWidget(index: 4),
                TeamWidget(index: 5),
                TeamWidget(index: 6),
                TeamWidget(index: 7),
                TeamWidget(index: 8),
                TeamWidget(index: 9),
                TeamWidget(index: 10),
                TeamWidget(index: 11),
                TeamWidget(index: 12),
                TeamWidget(index: 13),
                TeamWidget(index: 14),
                TeamWidget(index: 15),
                TeamWidget(index: 16),
                // TeamWidget(index: 8),
                // TeamWidget(index: 8),
                // TeamWidget(index: 8),
                // TeamWidget(index: 8),
                // TeamWidget(index: 8),
                // TeamWidget(index: 8),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(bottom: 25.0,right: 40,left: 40),
          child: SizedBox(
            width: double.infinity,
            // height: 52,
            child: ElevatedButton(
              onPressed: () {
                //   Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage(),),);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE7E7E7),

                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Jamoani nomi",
                    style: TextStyle(fontSize: 24, color: Colors.black,fontWeight: FontWeight.w300),
                  ),
                  TeamWidget(index: 10),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: double.infinity,
                // height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage(),),);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00B900),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Ro'yhatdan o'tish",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                // height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage(),),);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00B900),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Mehmon bo'lib kirish",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),

            ],
          ),
        ),

      ],
    );
  }






  void _onDropdownChanged(int? newIndex) {
    if (newIndex != null) {
      setState(
        () {
          _selectedIndex = newIndex;
          selectedPlayers.clear();
          playerSelected = List.generate(11, (_) => false);
          currentSelectedPosition = null;
        },
      );
    }
  }

  Widget buildDrop(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //   const SizedBox(height: 20),
        Container(
          margin: EdgeInsets.only(right: 4),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          height: 45,
          width: 100,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: _selectedIndex,
              onChanged: _onDropdownChanged,
              items: const [
                DropdownMenuItem<int>(
                  value: 0,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('1-3-4-3')),
                  ),
                ),
                DropdownMenuItem<int>(
                  value: 1,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('1-3-5-2')),
                  ),
                ),
                DropdownMenuItem<int>(
                  value: 2,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('1-4-5-1')),
                  ),
                ),
                DropdownMenuItem<int>(
                  value: 3,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('1-4-4-2')),
                  ),
                ),
              ],
              hint: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text('1-3-4-3'),
                ),
              ),
              icon: const Icon(null),
            ),
          ),
        )
      ],
    );
  }
}
