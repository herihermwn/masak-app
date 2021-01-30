part of '../../pages.dart';

class SearchRecipesController extends GetxController {
  final _apiService = Get.find<ApiService>();
  final TextEditingController query = TextEditingController();

  // State Condition
  RxBool getLatestRecipesDone = false.obs;
  RxBool doSearchDone = false.obs;
  RxBool searchRecipesDone = false.obs;

  // Value Recipes
  List<Recipe> newRecipes;
  List<Recipe> searchRecipes;

  SearchRecipesController() {
    requestDataApi();
  }


  Future<void> requestDataApi() async {
    newRecipes = await _apiService.getNewRecipes();

    if (newRecipes != null) {
      getLatestRecipesDone.toggle();
    }
  }

  Future<void> submitQuery() async {
    searchRecipes = await _apiService.getSearchRecipes(query.text);

    for (final recipe in searchRecipes) {
      print(recipe.title);
    }

  }

  void clearQuery() {
    query.clear();
  }

}