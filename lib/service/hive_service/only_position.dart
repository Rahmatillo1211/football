import 'package:hive/hive.dart';

import '../../model/only_position.dart';

class OnlyPosition{
  static void updatePlayerPosition(int nameIndex, int newPosition) async {
    final Box<PlayerPosition> playerPositionsBox = Hive.box<PlayerPosition>('playerPositions');

    // Check if an existing entry exists for this nameIndex
    final existingPosition = playerPositionsBox.get(nameIndex);

    if (existingPosition != null) {
      // Update existing entry
      playerPositionsBox.put(nameIndex, PlayerPosition(nameIndex, newPosition));
    } else {
      // Create a new entry
      playerPositionsBox.add(PlayerPosition(nameIndex, newPosition));
    }
  }
  static int getSavedPosition(int nameIndex) {
    final Box<PlayerPosition> playerPositionsBox = Hive.box<PlayerPosition>('playerPositions');
    final savedPosition = playerPositionsBox.get(nameIndex);
    return savedPosition?.position ?? 0; // Return default value (0) if not found
  }

}