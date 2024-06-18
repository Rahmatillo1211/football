import 'dart:convert';

import 'package:fantasy_football/model/players_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';


import '../flutter_toast.dart';

class HiveService extends GetxController {


  var objBox = Hive.box('Players');
  var tasksList = <PlayersModel>[].obs;
  var allTasks = <PlayersModel>[].obs;

  ///Hive yordamida obj saqlash :date time now orqali key berish
  storedObj({required var obj, required String objKey}) {
    String playersObj = jsonEncode(obj);
    objBox.put(objKey, playersObj);
    Logger().i("players info saved successfully");
  }

  ///Hamma Tasks objni olish funksiyasi
  List<PlayersModel> getObj() {
    tasksList.clear();
    allTasks.clear();
    for (var key in objBox.keys) {
      String stringObj = objBox.get(key);
      Map<String, dynamic> map = jsonDecode(stringObj);
      PlayersModel task = PlayersModel.fromJson(map);
      tasksList.add(task);
      allTasks.add(task);
    }

    return tasksList;
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



  deleteObj({required String objKey}) {
    objBox.delete(objKey);
    return showToast("deleted successfully");
  }


}
