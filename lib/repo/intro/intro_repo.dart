import 'package:dio/dio.dart';
import 'package:fantasy_football/models/players_model/players_model.dart';
import 'package:fantasy_football/utils/network/network_info.dart';

class IntroRepo {
  final Dio client;
  final NetworkInfo networkInfo;

  IntroRepo({required this.client, required this.networkInfo});

  Future<List<PlayersModel>> getPlayers() async {
    final res = await client.get("/api/v1/players");
    return res.data.map((players) => PlayersModel.fromJson(players)).toList();
  }
}
