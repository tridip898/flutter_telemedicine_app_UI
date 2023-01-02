import 'package:get/get.dart';

class BottomNavController extends GetxController{
  var selectedIndex=0;
  void changeIndex(int index){
    selectedIndex=index;
    update();
  }

}