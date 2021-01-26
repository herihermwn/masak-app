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
  Future<NewRecipesResponse> newRecipes();

  @GET(ApiConst.recipesLength)
  Future<NewRecipesResponse> lengthRecipes(@Query("limit") int limit);

  @GET(ApiConst.recipesCategory)
  Future<CategoryRecipesResponse> recipesCategory();

}