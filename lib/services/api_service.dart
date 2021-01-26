part of 'services.dart';

class ApiService {
  Dio _dio;
  RestClient _restClient;

  ApiService() {
    _dio = Dio();
    _restClient = RestClient(_dio);
  }

  Future<List<Recipes>> getNewRecipes() async {
    NewRecipesResponse response = await _restClient.newRecipes();

    if (response.status) {
      return response.results;
    } else {
      return null;
    }
  }

  Future<List<Recipes>> getRangeRecipes(int limit) async {
    NewRecipesResponse response = await _restClient.lengthRecipes(limit);

    if (response.status) {
      return response.results;
    } else {
      return null;
    }
  }

  Future<List<CategoryRecipes>> getCategoryRecipes() async {
    CategoryRecipesResponse response = await _restClient.recipesCategory();
    
    if (response.status) {
      return response.results;
    } else {
      return null;
    }
  }
}
