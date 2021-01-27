part of '../../pages.dart';

class RecipesByCategoryController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();
  final CategoryRecipes category = Get.arguments as CategoryRecipes;
  
  List<Recipe> listRecipes;
  RxBool isDone = false.obs;
  
  RecipesByCategoryController() {
    requestDataAPI();
  }

  Future<void> requestDataAPI() async {
    listRecipes = await _apiService.getRecipesByCategory(category.key);

    if (listRecipes != null) {
      
      isDone.toggle();
    }
  }

}
