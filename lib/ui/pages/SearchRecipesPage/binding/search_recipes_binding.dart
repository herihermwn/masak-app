part of '../../pages.dart';

class SearchRecipesBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SearchRecipesController());
  }

}