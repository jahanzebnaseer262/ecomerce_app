import 'package:e_commerce/data/repositries/categories/category_repository.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();
  RxBool isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }


  Future<void> fetchCategories() async {
    try {
//show loader while loading categories
      isLoading.value = true;

      //fetch categories form data source
      final categories = await _categoryRepository.getAllCategories();

      //update the categories list
      allCategories.assignAll(categories);

      //filter featured categories
      featuredCategories.assignAll(
          allCategories.where((category) => category.isFeatured &&
              category.parentId.isEmpty).take(8).toList());

    } catch (e) {
      TLoaders.errorSnackBar(title: 'oh snap!', message: e.toString());
    } finally {

    }
  }
}