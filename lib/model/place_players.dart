import 'package:fantasy_football/service/hive_service/only_position.dart';
import 'package:fantasy_football/service/hive_service/selection_section.dart';
import 'package:fantasy_football/ui/first/selctionTeam/player_cubit.dart';
import 'package:fantasy_football/ui/first/selctionTeam/player_state.dart';
import 'package:fantasy_football/ui/first/selctionTeam/selection_tea_state.dart';
import 'package:fantasy_football/ui/first/selctionTeam/slection_team_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../../../other/lists.dart';

class SelectionTeam extends StatefulWidget {
  const SelectionTeam({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SelectionTeamState();
  }
}

class _SelectionTeamState extends State<SelectionTeam> {
  int _selectedIndex = 0;
  // PlayersList playersList = Get.put(PlayersList());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
    // final cubit = context.read<SelactionTeamCubit>();
    // cubit.getplayersList();
  }

  // String s = SelectionSection.getSection() ?? "1-3-4-3";
  String s = "1-3-4-3";

  void check() async {
    var team = await PrefSection.getSection();
    setState(() {
      s = team!;
      if (s == teamSection[1]) {
        _selectedIndex = 1;
      } else if (s == teamSection[2]) {
        _selectedIndex = 2;
      } else if (s == teamSection[3]) {
        _selectedIndex = 3;
      }
    });
  }

  List<bool> playerSelected = List.generate(11, (_) => false);
  Map<int, int> selectedPlayers = {};
  int? currentSelectedPosition;

  // get teamSection => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<PlayersCubit, PlayersState>(

        builder: (context, state) {
      if (state is PlayersInitial) {
        return Center(child: Text('Please wait...'));
      } else if (state is PlayersLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is PlayersLoaded) {
        return Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(right: 20),
              decoration: const BoxDecoration(
                color: Color(0xff1F9059),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              width: 350,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Kamanda Tering",
                    style: TextStyle(fontSize: 20),
                  ),
                  buildDrop(context),
                ],
              ),
            ),
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
                  final player = state.players[index];                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 8),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: playerSelected[index]
                              ? null
                              : () {
                            OnlyPosition.updatePlayerPosition(
                                index, index);
                            setState(() {
                              if (currentSelectedPosition != null) {
                                selectedPlayers[
                                currentSelectedPosition!] = index;
                                playerSelected[index] = true;
                                currentSelectedPosition = null;
                              }
                            });
                          },
                          child: playerSelected[index]
                              ? Container(
                              width: 0, height: 0)
                              : Image.asset("assets/images/player.png"),
                        ),
                        const SizedBox(height: 10),
                        playerSelected[index]
                            ? Container(width: 0, height: 0)
                            : Text(
                          player.name??"",
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
                itemCount: state.players.length,
              ),
            ),
            const SizedBox(height: 10),
          ],
        );
      } else if (state is PlayersError) {
        return Center(child: Text(state.message));
      }
      return Container();
    });
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
    double verticalSpacing = 110.0;

    positions.addAll(_buildLine(
        goalkeepers, fieldHeight / 2 - verticalSpacing * 3, fieldWidth - 15));
    positions.addAll(_buildLine(
        defenders, fieldHeight / 2 - verticalSpacing * 2, fieldWidth - 15));
    positions.addAll(_buildLine(
        midfielders, fieldHeight / 2 - verticalSpacing, fieldWidth - 15));
    positions.addAll(_buildLine(forwards, fieldHeight / 2, fieldWidth - 15));

    return positions;
  }

  List<Widget> _buildLine(
      int playerCount, double topOffset, double fieldWidth) {
    List<Widget> linePositions = [];
    double spacing = 70.0; // Adjusted spacing between players
    double leftOffset = (fieldWidth - (playerCount - 1) * spacing) / 2;

    for (int i = 0; i < playerCount; i++) {
      int positionKey = topOffset.toInt() * 10 + i;
      linePositions.add(
        Positioned(
          top: topOffset,
          left: leftOffset + (i * spacing),
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
      print("$newIndex ++++++++++++++++++++++++++++++++++++++++++++");
      PrefSection.saveSection(teamSection[newIndex]);

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
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff1F9059),
      ),
      height: 50,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          value: _selectedIndex,
          onChanged: _onDropdownChanged,
          items: [
            DropdownMenuItem<int>(
              value: 0,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                      teamSection[0],
                      style: TextStyle(fontSize: 20),
                    )),
              ),
            ),
            DropdownMenuItem<int>(
              value: 1,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                      teamSection[1],
                      style: TextStyle(fontSize: 20),
                    )),
              ),
            ),
            DropdownMenuItem<int>(
              value: 2,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                      teamSection[2],
                      style: TextStyle(fontSize: 20),
                    )),
              ),
            ),
            DropdownMenuItem<int>(
              value: 3,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                      teamSection[3],
                      style: TextStyle(fontSize: 20),
                    )),
              ),
            ),
          ],
          hint: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text('Select Formation'),
            ),
          ),
          icon: const Icon(null),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class PlayersPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => PlayersCubit()..fetchPlayers(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Players'),
//         ),
//         body: BlocBuilder<PlayersCubit, PlayersState>(
//           builder: (context, state) {
//             if (state is PlayersInitial) {
//               return Center(child: Text('Please wait...'));
//             } else if (state is PlayersLoading) {
//               return Center(child: CircularProgressIndicator());
//             } else if (state is PlayersLoaded) {
//               return Column(
//                 children: <Widget>[
//                   Container(
//                     padding: const EdgeInsets.only(right: 20),
//                     decoration: const BoxDecoration(
//                       color: Color(0xff1F9059),
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                     ),
//                     width: 350,
//                     height: 50,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         const Text(
//                           "Kamanda Tering",
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         buildDrop(context),
//                       ],
//                     ),
//                   ),
//                   _buildStack(),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.blueGrey,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     width: 350,
//                     height: 100,
//                     child: ListView.separated(
//                       scrollDirection: Axis.horizontal,
//                       shrinkWrap: true,
//                       itemBuilder: (_, index) {
//                         final players = cubit.playersList[index];
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 20.0, horizontal: 8),
//                           child: Column(
//                             children: [
//                               InkWell(
//                                 onTap: playerSelected[index]
//                                     ? null
//                                     : () {
//                                   OnlyPosition.updatePlayerPosition(
//                                       index, index);
//                                   setState(() {
//                                     if (currentSelectedPosition != null) {
//                                       selectedPlayers[
//                                       currentSelectedPosition!] = index;
//                                       playerSelected[index] = true;
//                                       currentSelectedPosition = null;
//                                     }
//                                   });
//                                 },
//                                 child: playerSelected[index]
//                                     ? Container(
//                                     width: 0, height: 0)
//                                     : Image.asset("assets/images/player.png"),
//                               ),
//                               const SizedBox(height: 10),
//                               playerSelected[index]
//                                   ? Container(width: 0, height: 0)
//                                   : Text(
//                                 players.name??"",
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                       separatorBuilder: (_, index) {
//                         return const SizedBox(width: 10);
//                       },
//                       itemCount: cubit.playersList.length,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                 ],
//               );
//             } else if (state is PlayersError) {
//               return Center(child: Text(state.message));
//             }
//             return Container();
//           },
//         ),
//       ),
//     );
//   }
// }

// ListView.builder(
// itemCount: state.players.length,
// itemBuilder: (context, index) {
// final player = state.players[index];
// return ListTile(
// title: Text(player.name ?? ''),
// subtitle: Text('${player.position} - #${player.playerNumber}'),
// );
// },
// )