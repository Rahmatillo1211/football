import 'package:get/get.dart';

class IsSelectedPlayer extends GetxController{
  var select = false.obs;
void changePlayer(){
    select.value= ! select.value;
  }
}