import 'package:fantasy_football/other/lists.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/is_selected_player.dart';

class Player extends StatelessWidget {
  IsSelectedPlayer selected = Get.put(IsSelectedPlayer());

  Player(
      {super.key,
      required this.onPress,
      required this.index}); // Add onPress function

  final VoidCallback onPress; // Define the function type
  final int index; // Define the function type

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPress, // Use the onPress function
          child:CircleAvatar(
                backgroundColor:
                    selected.select.value ? Colors.green : Colors.transparent,
                child: Image.asset("assets/images/player.png"),
              ),
        ),
        Text(
          playerNames[index],
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
