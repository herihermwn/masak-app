part of '../../pages.dart';

class RecipesByCategoryBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(RecipesByCategoryController());
  }

}