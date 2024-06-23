import 'package:fantasy_football/models/players_model/players_model.dart';
import 'package:fantasy_football/repo/intro/intro_repo.dart';
import 'package:fantasy_football/ui/first/selctionTeam/selection_tea_state.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelactionTeamCubit extends Cubit<SelectionTeamState> {
  SelactionTeamCubit({required this.repo}) : super(InitialState());
  final IntroRepo repo;
  List<PlayersModel> playersList = [];
  void getplayersList() async {
    try {
      emit(GetTeamState(state: SelectionTeeamPageState.loading));
      final res = await repo.getPlayers();
      playersList = res;
      emit(GetTeamState(state: SelectionTeeamPageState.loaded));
    } catch (e) {
      emit(GetTeamState(state: SelectionTeeamPageState.error));
    }
  }
}
