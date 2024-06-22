import 'package:fantasy_football/other/lists.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/is_selected_player.dart';

class Player extends StatelessWidget {
  IsSelectedPlayer selected = Get.put(IsSelectedPlayer());

  Player(
      {super.key,
      required this.onPress,
      required this.index}); 

  final VoidCallback onPress; 
  final int index; 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPress, 
          child:CircleAvatar(
                backgroundColor:
                    selected.select.value ? Colors.green : Colors.transparent,
                child: Image.asset("assets/images/player.png"),
              ),
        ),
        Text(
          playerNames[index],
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
