part of '../../pages.dart';

class DetailRecipeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailRecipeController());
  }
  
}