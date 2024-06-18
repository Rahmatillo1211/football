import 'package:hive/hive.dart';

class SelectionSection {
  static var box = Hive.box('mySection');

  static void saveSection(String section) {
    box.put('section', section);
  }

  static  getSection() {
    var name = box.get('section');
    print('Name: $name');
    return name;
  }
}
