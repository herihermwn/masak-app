part of '../../pages.dart';

class SplashController extends GetxController {
  
  SplashController() {
    movePage();
  }

  Future<void> movePage() async {
    Future.delayed(Duration(seconds: 2), () {
      Get.offAndToNamed("/home");
    });
  }
}
