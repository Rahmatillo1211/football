import 'package:get/get.dart';

import '../model/players_model.dart';

class PlayersList extends GetxController {
  var playersList = <Player>[].obs;

  void getValue(List<Player> player) {
    playersList.value = player;
  }
}
