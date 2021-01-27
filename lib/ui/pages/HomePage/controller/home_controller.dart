part of '../../pages.dart';

class HomeController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();
  final Random random = new Random();

  List<Recipe> randomRecipes;
  List<CategoryRecipes> listCategory;
  RxBool isDone = false.obs;

  HomeController() {
    requestDataAPI();
  }

  Future<void> requestDataAPI() async {
    listCategory = await _apiService.getCategoryRecipes();
    randomRecipes = await _apiService.getRangeRecipes(random.nextInt(7) + 4);

    if (listCategory != null) {
      for (final category in listCategory) {
        // Remove url
        category.url = category.url
            .replaceAll("https://www.masakapahariini.com/resep-masakan/", "")
            .replaceAll('/', '');

        // Filter category
        if (category.url == "masakan-hari-raya") {
          category.url =
              "https://www.masakapahariini.com/wp-content/uploads/2018/04/menu-hari-raya-1920x250.jpg";
        } else {
          category.url =
              "https://www.masakapahariini.com/wp-content/uploads/2018/04/${category.url}-780x600.jpg";
        }
      }

      isDone.toggle();
    }
  }
}
