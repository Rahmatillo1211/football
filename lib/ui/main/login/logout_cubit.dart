import 'package:fantasy_football/repo/logout_repo.dart';
import 'package:fantasy_football/ui/main/login/logout_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutCubit extends Cubit<LogoutState>{
  LogoutCubit( {required this.repo}):super(InitialLogout()) ;
  final LogoutRepo repo;
  void logoutPlatform() async {
    try {
      emit(LoadingLogout());
      await repo.logout();
      emit(LoadedLogout());

    } catch (e) {
      emit(LogoutError());
    }
  }

}