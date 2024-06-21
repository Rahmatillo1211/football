
import 'package:bloc/bloc.dart';
import 'package:fantasy_football/repo/login_repo.dart';
import 'package:fantasy_football/ui/main/login/login_state.dart';

class LoginCubit extends Cubit<LoginPageState> {
  LoginCubit( {required this.repo}):super(InitialState()) ;
  final LoginRepo repo;

  void logintoPlatform(String email, String password) async {
    try {
      emit(Loading());
      await repo.login(email, password);
      emit(Loaded());
    } catch (e) {
      emit(Error());
    }
  }
}
