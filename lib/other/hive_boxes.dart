import 'package:hive_flutter/adapters.dart';

Future<void> hiveBoxes() async {
  await Hive.initFlutter();
  await Hive.openBox("email_password");
  await Hive.openBox('playerPositions');

  await Hive.openBox("Players");
  await Hive.openBox("Places");
  await Hive.openBox("myCapitan");
  await Hive.openBox("mySection");
  await Hive.openBox("myTeam");
}
