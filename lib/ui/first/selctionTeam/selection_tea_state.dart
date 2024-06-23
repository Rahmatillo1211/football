import 'package:fantasy_football/models/players_model/players_model.dart';

abstract class SelectionTeamState {}

class InitialState extends SelectionTeamState {}

class GetTeamState extends SelectionTeamState {
  final SelectionTeeamPageState state;
  final List<PlayersModel>? players;
  final String? errorMsg;

  GetTeamState({required this.state, this.players, this.errorMsg});
}

enum SelectionTeeamPageState { loading, loaded, error }
