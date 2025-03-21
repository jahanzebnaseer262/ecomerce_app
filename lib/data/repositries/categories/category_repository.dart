import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  ///variables
  final supaBase = Supabase.instance.client;

  ///Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final response = await supaBase
          .from('categories')
          .select('id, name, image, isFeatured, parentId');

      return response.map((json) => CategoryModel.fromJson(json)).toList();
    } on AuthException catch (e) {
      throw Exception(e.code);
    } catch (e) {
      print(e.toString());
      throw Exception("Failed to fetch categories: $e"); // Ensures the function always returns a value
    }
  }


}
