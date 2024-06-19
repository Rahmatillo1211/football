import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

class OnlyPosition {
  static var box = Hive.box('playerPositions');

  static void savePosition(String name, int key) {

    box.put(key, name);
    Logger().i("saved successfully");
  }

  static getPosition(int key) {
    var name = box.get(key);
    Logger().i(name);
    return name;
  }
}
