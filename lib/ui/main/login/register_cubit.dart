import 'package:fantasy_football/repo/auth/register_repo.dart';
import 'package:fantasy_football/ui/main/login/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState>{
  RegisterCubit({required this.repo}):super(RegisterInitialState());
  final RegisterRepo repo ;
 void   registration({required String email,
    required String password,
    required String nickname})async{
    try{
      emit(RegisterLoading());
    await repo.registerService(email: email, password: password, nickname: nickname);
          emit(RegisterLoaded());
    }catch(e){
          emit(RegisterError());
    }

  }

}