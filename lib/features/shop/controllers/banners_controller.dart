import 'package:e_commerce/data/repositries/banners/banner_repository.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../utils/popups/loaders.dart';

class BannerController extends GetxController{
  Rx<int> selectedIndicator =0.obs;
  final isLoading= false.obs;
final bannnerRepository= Get.put(BannerRepository());
//final supaBase= Supabase.instance.client;
  final banners= <String>[].obs;
  void updatePage(index){
    selectedIndicator.value=index;
  }

  @override
  void onInit() {
    super.onInit();
    fetchBanners();
  }

  Future<void> fetchBanners() async {
    try {
//show loader while loading categories
      isLoading.value = true;

      final response = await Supabase.instance.client
          .storage
          .from('banners') // Replace 'banners' with your actual bucket name
          .list();
      print(response);
      // Generate public URLs
      List<String> urls = response.map((file) {
        return Supabase.instance.client.storage
            .from('banners')
            .getPublicUrl(file.name);
      }).toList();

      print(urls);

      banners.assignAll(urls); // Update observable list

    } catch (e) {
      TLoaders.errorSnackBar(title: 'oh snap!', message: e.toString());
      throw Exception(e.toString());
    } finally {

    }
  }
}