part of '../../pages.dart';

class DetailRecipeController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();
  final Recipe recipe = Get.arguments as Recipe;

  DetailRecipe detailRecipe;
  RxBool isDone = false.obs;

  DetailRecipeController() {
    requestDataApi();
  }

  Future<void> requestDataApi() async {
    detailRecipe = await _apiService.getDetailRecipe(recipe.key);

    if (detailRecipe != null) {
      isDone.toggle();
    }
  }
}
