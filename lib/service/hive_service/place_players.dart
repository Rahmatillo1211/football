import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:logger/logger.dart';


import '../../model/place_players.dart';
import '../flutter_toast.dart';

class PlacePlayersService  {


 static var objBox = Hive.box('Places');
 static  var allTasks = <PlacePlayers>[];

  ///Hive yordamida obj saqlash :date time now orqali key berish
 static storedObj({required var obj, required String objKey}) {
    String playersObj = jsonEncode(obj);
    objBox.put(objKey, playersObj);
    Logger().i("players info saved successfully");
  }

  ///Hamma Tasks objni olish funksiyasi
 static List<PlacePlayers> getObj() {
    allTasks.clear();
    for (var key in objBox.keys) {
      String stringObj = objBox.get(key);
      Map<String, dynamic> map = jsonDecode(stringObj);
      PlacePlayers task = PlacePlayers.fromJson(map);
      allTasks.add(task);
    }

    return allTasks;
  }

  // void getTasksForSelectedDate(DateTime date) {
  //   var allTasks = getObj(); // This fetches all tasks from Hive
  //   tasksList.value = allTasks.where((task) {
  //     DateTime startDate = DateTime.parse(task.startDate!);
  //     // Assuming 'startDate' is stored as a string in ISO format
  //     return startDate.year == date.year &&
  //         startDate.month == date.month &&
  //         startDate.day == date.day;
  //   }).toList();
  //   tasksList.value = tasksList.reversed.toList(); // Reverse the filtered list
  // }



 static deleteObj({required String objKey}) {
    objBox.delete(objKey);
    return showToast("deleted successfully");
  }


}
