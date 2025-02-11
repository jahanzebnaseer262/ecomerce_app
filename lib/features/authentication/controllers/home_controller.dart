import 'package:get/get.dart';
class HomeController extends GetxController{
  static HomeController get instance =>Get.find();
  Rx<int> selectedIndicator =0.obs;

  void updatePage(index){
    selectedIndicator.value=index;
  }



}