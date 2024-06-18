// import 'package:fantasy_football/widgets/player_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../controller/is_selected_player.dart';
// import '../../other/lists.dart';
//
// class SelectionCapitan extends StatefulWidget {
//   const SelectionCapitan({super.key});
//
//   @override
//   State<StatefulWidget> createState() {
//     return _SelectionCapitanState();
//   }
// }
//
// class _SelectionCapitanState extends State<SelectionCapitan> {
//   IsSelectedPlayer selected = Get.put(IsSelectedPlayer());
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     check();
//   }
//
//   void check() {
//     setState(() {
//       if (section == teamSection[1]) {
//         _selectedIndex = 1;
//       } else if (section == teamSection[2]) {
//         _selectedIndex = 2;
//       } else if (section == teamSection[3]) {
//         _selectedIndex = 3;
//       }
//     });
//   }
//
//   int _selectedIndex = 0;
//   List<String> playerNames = [
//     "Player 1",
//     "Player 2",
//     "Player 3",
//     "Player 4",
//     "Player 5",
//     "Player 6",
//     "Player 7",
//     "Player 8",
//     "Player 9",
//     "Player 10",
//     "Player 11",
//   ];
//   List<bool> playerSelected = List.generate(11, (_) => false);
//   Map<int, int> selectedPlayers = {};
//   int? currentSelectedPosition;
//
//   void selectCapitan() {
//     selected.changePlayer();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _buildBody(context),
//     );
//   }
//
//   Widget _buildBody(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         const Text(
//           "Kapitanni tanlang",
//           style: TextStyle(fontSize: 25),
//         ),
//         Container(
//           decoration: const BoxDecoration(
//             color: Color(0xff1F9059),
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(10),
//               topRight: Radius.circular(10),
//               bottomLeft: Radius.circular(5),
//               bottomRight: Radius.circular(5),
//             ),
//           ),
//           margin: EdgeInsets.symmetric(horizontal: 12),
//           width: 433,
//           height: 50,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(right: 20.0),
//                 child: Text(
//                   section,
//                   style: TextStyle(fontSize: 20),
//                 ),
//               )
//             ],
//           ),
//         ),
//         _buildStack(),
//       ],
//     );
//   }
//
//   Widget _buildStack() {
//     List<Widget> playerPositions = _getFormationPlayers();
//
//     return Stack(
//       children: [
//         Image.asset(
//           height: 433,
//           "assets/images/football_field.png",
//           width: double.infinity,
//         ),
//         //...playerPositions,
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 55,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Player(
//                   onPress: () {
//                     selectCapitan();
//                     print("18++++++++++++++++++++++++++++++++++++++++");
//                   },
//                   index: 0,
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 55,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Player(
//                   onPress: () {
//                     selectCapitan();
//                     print("2++++++++++++++++++++++++++++++++++++++++");
//                   },
//                   index: 1,
//                 ),
//                 Player(
//                   onPress: () {
//                     selectCapitan();
//                     print("3++++++++++++++++++++++++++++++++++++++++");
//                   },
//                   index: 2,
//                 ),
//                 Player(
//                   onPress: () {
//                     selectCapitan();
//                     print("4++++++++++++++++++++++++++++++++++++++++");
//                   },
//                   index: 3,
//                 ),
//               ],
//             ),
//             // SizedBox(height: 55,),
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             //
//             //   children: [
//             //     Player(),
//             //     Player(),
//             //     Player(),
//             //     Player(),
//             //     Player(),
//             //   ],
//             // ),
//             // SizedBox(height: 55,),
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             //
//             //   children: [
//             //     Player(),
//             //     Player(),
//             //   ],
//             // ),
//           ],
//         )
//       ],
//     );
//   }
//
//   List<Widget> _getFormationPlayers() {
//     List<Widget> formationPlayers = [];
//
//     switch (_selectedIndex) {
//       case 0:
//         formationPlayers = _buildFormation(1, 3, 4, 3);
//         break;
//       case 1:
//         formationPlayers = _buildFormation(1, 3, 5, 2);
//         break;
//       case 2:
//         formationPlayers = _buildFormation(1, 4, 5, 1);
//         break;
//       case 3:
//         formationPlayers = _buildFormation(1, 4, 4, 2);
//         break;
//     }
//
//     return formationPlayers;
//   }
//
//   List<Widget> _buildFormation(
//       int goalkeepers, int defenders, int midfielders, int forwards) {
//     List<Widget> positions = [];
//     double fieldWidth = MediaQuery.of(context).size.width;
//     double fieldHeight = MediaQuery.of(context).size.height;
//     double verticalSpacing = 100.0;
//
//     positions.addAll(_buildLine(
//         goalkeepers, fieldHeight / 2 - verticalSpacing * 3, fieldWidth - 30));
//     positions.addAll(_buildLine(
//         defenders, fieldHeight / 2 - verticalSpacing * 2, fieldWidth - 30));
//     positions.addAll(_buildLine(
//         midfielders, fieldHeight / 2 - verticalSpacing, fieldWidth - 30));
//     positions.addAll(_buildLine(forwards, fieldHeight / 2, fieldWidth - 30));
//
//     return positions;
//   }
//
//   List<Widget> _buildLine(
//       int playerCount, double topOffset, double fieldWidth) {
//     List<Widget> linePositions = [];
//     double leftOffset = (fieldWidth - (playerCount - 1) * 90.0) / 2;
//
//     for (int i = 0; i < playerCount; i++) {
//       int positionKey = topOffset.toInt() * 10 + i;
//       linePositions.add(
//         Positioned(
//           top: topOffset,
//           left: leftOffset + (i * 90.0),
//           child: InkWell(
//             onTap: () {
//               setState(
//                 () {
//                   if (selectedPlayers.containsKey(positionKey)) {
//                     int playerIndex = selectedPlayers[positionKey]!;
//                     playerSelected[playerIndex] = false;
//                     selectedPlayers.remove(positionKey);
//                   } else {
//                     currentSelectedPosition = positionKey;
//                   }
//                 },
//               );
//             },
//             child: Column(
//               children: [
//                 GestureDetector(
//                     onTap: () {},
//                     child: Image.asset("assets/images/player.png")),
//                 const Text(
//                   "player",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     }
//     return linePositions;
//   }
// }
