import 'package:dio/dio.dart' hide Headers;
import 'package:masak_app/core/models/models.dart';
import 'package:retrofit/retrofit.dart';
import 'api_const.dart';

part 'rest_client.g.dart';

//? ---------------------------------------------------------------------
//* Add new request http here. Then run command
//* "flutter pub run build_runner build --delete-conflicting-outputs"
//? ---------------------------------------------------------------------
@RestApi(baseUrl: ApiConst.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(ApiConst.newRecipes)
  Future<RecipesResponse> newRecipes();

  @GET(ApiConst.detailRecipes)
  Future<DetailRecipeResponse> detailRecipe(@Path("key") String key);

  @GET(ApiConst.recipesLength)
  Future<RecipesResponse> lengthRecipes(@Query("limit") int limit);

  @GET(ApiConst.searchRecipes)
  Future<RecipesResponse> searchRecipes(@Query("q") String query);

  @GET(ApiConst.recipesByCategory)
  Future<RecipesResponse> recipesByCategory(@Path("key") String key);

  @GET(ApiConst.categoryRecipes)
  Future<CategoryRecipesResponse> categoryRecipes();
}
