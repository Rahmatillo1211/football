import 'package:fantasy_football/model/players_model.dart';
import 'package:get/get.dart';

class PlayersList extends GetxController{
  var playersList = <Player>[].obs;
  void getPlayers(List<Player> players){
    playersList.value = players;
  }
}