import 'dart:async';
import 'package:e_commerce/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;  // ✅ Updated type
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  /// Initialize network monitoring
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  /// Update connectivity status (handling List<ConnectivityResult>)
  Future<void> _updateConnectionStatus(List<ConnectivityResult> results) async {
    if (results.isNotEmpty) {
      _connectionStatus.value = results.first;  // ✅ Get first connection type
    }

    if (_connectionStatus.value == ConnectivityResult.none) {
      TLoaders.warningSnackBar(title: 'No Internet Connection');
    }
  }

  /// Check if the device is connected to the internet
  Future<bool> isConnected() async {
    try {
      var result = await Connectivity().checkConnectivity();

      if (result == ConnectivityResult.none) {
        return false;
      }
      return true;
    } catch (e) {
      print('⚠️ Network check failed: $e');
      return false; // Assume no connection on error
    }
  }


  /// Cleanup: Stop listening to connectivity changes
  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}
