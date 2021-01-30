part of '../../pages.dart';

class SearchRecipesController extends GetxController {
  final _apiService = Get.find<ApiService>();
  final TextEditingController query = TextEditingController();

  // State Condition
  RxBool getLatestRecipesDone = false.obs;
  RxBool doSearch = false.obs;
  RxBool searchRecipesDone = false.obs;
  RxBool failedRequest = false.obs;

  // Value Recipes
  List<Recipe> newRecipes;
  List<Recipe> searchRecipes;

  SearchRecipesController() {
    requestDataApi();
  }

  Future<void> requestDataApi() async {
    // do request to Api
    newRecipes = await _apiService.getNewRecipes();

    if (newRecipes != null) {
      getLatestRecipesDone.toggle();
    }
  }

  Future<void> submitQuery() async {
    // Make sure obs are false
    doSearch.value = false;
    searchRecipesDone.value = false;

    // Show loading progress
    doSearch.value = true;

    // do request to Api
    searchRecipes = await _apiService.getSearchRecipes(query.text);

    // Show failed message if null
    if (searchRecipes == null) {
      failedRequest.value = true;
    }

    // Close loading widget
    searchRecipesDone.value = true;
  }

  void retrySearch() {
    // Show failed message
    failedRequest.value = false;
    // Submit query
    submitQuery();
  }

  void clearQuery() {
    // Clear query
    query.clear();
  }
}
