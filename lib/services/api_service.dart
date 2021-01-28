part of 'services.dart';

class ApiService {
  Dio _dio;
  RestClient _restClient;

  ApiService() {
    _dio = Dio();
    _restClient = RestClient(_dio);
  }

  Future<List<Recipe>> getNewRecipes() async {
    RecipesResponse response = await _restClient.newRecipes();

    if (response.status) {
      return response.results;
    } else {
      return null;
    }
  }

  Future<DetailRecipe> getDetailRecipe(String key) async {
    DetailRecipeResponse response = await _restClient.detailRecipe(key);

    if (response.status) {
      return response.results;
    } else {
      return null;
    }
  }

  Future<List<Recipe>> getRangeRecipes(int limit) async {
    RecipesResponse response = await _restClient.lengthRecipes(limit);

    if (response.status) {
      return response.results;
    } else {
      return null;
    }
  }

  Future<List<Recipe>> getRecipesByCategory(String key) async {
    RecipesResponse response = await _restClient.recipesByCategory(key);

    if (response.status) {
      return response.results;
    } else {
      return null;
    }
  }

  Future<List<CategoryRecipes>> getCategoryRecipes() async {
    CategoryRecipesResponse response = await _restClient.categoryRecipes();

    if (response.status) {
      return response.results;
    } else {
      return null;
    }
  }
}
