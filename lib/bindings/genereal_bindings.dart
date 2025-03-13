import 'package:e_commerce/utils/network_manager/network_manager.dart';
import 'package:get/get.dart';

class GeneralBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(NetworkManager());
  }
}