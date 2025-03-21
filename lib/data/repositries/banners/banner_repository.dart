import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
class BannerRepository extends GetxController{
  static BannerRepository get instance => Get.find();

  final supaBase= Supabase.instance.client;

  Future<List<dynamic>> fetchBanners() async{
    try{
      final data = await supaBase
          .from('banners')
          .select();
      return data;

    } catch(e){
throw Exception(e.toString());
    }
  }
}