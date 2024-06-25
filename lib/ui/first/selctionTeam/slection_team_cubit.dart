import 'package:fantasy_football/models/players_model/players_model.dart';
import 'package:fantasy_football/repo/intro/intro_repo.dart';
import 'package:fantasy_football/ui/first/selctionTeam/selection_tea_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class SelectionTeamCubit extends Cubit<SelectionTeamState> {
  SelectionTeamCubit({required this.repo}) : super(InitialState());
  final IntroRepo repo;
  List<PlayersModel> playersList = [];

  getPlayersList() async {
    try {
      emit(GetTeamState(state: SelectionTeeamPageState.loading));
      final res = await repo.getPlayers();
      playersList = res;
      Logger().i(res.first);
      Logger().i(playersList);

      emit(GetTeamState(state: SelectionTeeamPageState.loaded));
      return Logger().i(playersList.first);
    } catch (e) {
      emit(GetTeamState(state: SelectionTeeamPageState.error));
    }
  }
}
