import 'package:flutter/material.dart';

class SelectionTeam extends StatefulWidget {
  const SelectionTeam({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SelectionTeamState();
  }
}

class _SelectionTeamState extends State<SelectionTeam> {
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
        const Text("data"),
        buildDrop(context),
        _buildStack(),
        Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(10),
          ),
          width: 350,
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8),
                child: Column(
                  children: [
                    InkWell(
                      onTap: playerSelected[index]
                          ? null
                          : () {
                              setState(() {
                                if (currentSelectedPosition != null) {
                                  selectedPlayers[currentSelectedPosition!] =
                                      index;
                                  playerSelected[index] = true;
                                  currentSelectedPosition = null;
                                }
                              });
                            },
                      child: playerSelected[index]
                          ? Container(width: 0, height: 0) // Hide the image
                          : Image.asset("assets/images/player.png"),
                    ),
                    const SizedBox(height: 10),
                    playerSelected[index]
                        ? Container(width: 0, height: 0) // Hide the text
                        : Text(
                            playerNames[index],
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                  ],
                ),
              );
            },
            separatorBuilder: (_, index) {
              return const SizedBox(width: 10);
            },
            itemCount: playerNames.length,
          ),
        ),
        const SizedBox(height: 10),

      ],
    );
  }



  Widget _buildStack() {
    List<Widget> playerPositions = _getFormationPlayers();

    return Stack(
      children: [
        Image.asset(
          "assets/images/football_field.png",
          width: double.infinity,
        ),
        ...playerPositions,
      ],
    );
  }

  List<Widget> _getFormationPlayers() {
    List<Widget> formationPlayers = [];

    switch (_selectedIndex) {
      case 0:
        formationPlayers = _buildFormation(1, 3, 4, 3);
        break;
      case 1:
        formationPlayers = _buildFormation(1, 3, 5, 2);
        break;
      case 2:
        formationPlayers = _buildFormation(1, 4, 5, 1);
        break;
      case 3:
        formationPlayers = _buildFormation(1, 4, 4, 2);
        break;
    }

    return formationPlayers;
  }

  List<Widget> _buildFormation(
      int goalkeepers, int defenders, int midfielders, int forwards) {
    List<Widget> positions = [];
    double fieldWidth = MediaQuery.of(context).size.width;
    double fieldHeight = MediaQuery.of(context).size.height;
    double verticalSpacing = 100.0;

    positions.addAll(_buildLine(
        goalkeepers, fieldHeight / 2 - verticalSpacing * 3, fieldWidth));
    positions.addAll(_buildLine(
        defenders, fieldHeight / 2 - verticalSpacing * 2, fieldWidth));
    positions.addAll(
        _buildLine(midfielders, fieldHeight / 2 - verticalSpacing, fieldWidth));
    positions.addAll(_buildLine(forwards, fieldHeight / 2, fieldWidth));

    return positions;
  }

  List<Widget> _buildLine(
      int playerCount, double topOffset, double fieldWidth) {
    List<Widget> linePositions = [];
    double leftOffset = (fieldWidth - (playerCount - 1) * 90.0) /
        2; 

    for (int i = 0; i < playerCount; i++) {
      int positionKey = topOffset.toInt() * 10 + i;
      linePositions.add(
        Positioned(
          top: topOffset,
          left: leftOffset + (i * 90.0), 
          child: InkWell(
            onTap: () {
              setState(
                () {
                  if (selectedPlayers.containsKey(positionKey)) {
                    int playerIndex = selectedPlayers[positionKey]!;
                    playerSelected[playerIndex] = false;
                    selectedPlayers.remove(positionKey);
                  } else {
                    currentSelectedPosition = positionKey;
                  }
                },
              );
            },
            child: selectedPlayers.containsKey(positionKey)
                ? Column(
                    children: [
                      Image.asset("assets/images/player.png"),
                      Text(
                        playerNames[selectedPlayers[positionKey]!],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                : Image.asset("assets/images/add_pleyer.png"),
          ),
        ),
      );
    }
    return linePositions;
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
        const SizedBox(height: 20),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          height: 50,
          width: 90,
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
