part of '../../pages.dart';

class SplashView extends StatelessWidget {
  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: noAppBar,
      backgroundColor: greenColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "$svgAsset/chef_hat.svg",
              width: 180.w,
              height: 180.h,
              color: whiteColor,
            ),
            SizedBox(height: 70.h),
            TextFormat(
              "Masak App",
              fontSize: 44.ssp,
              fontWeight: FontWeight.bold,
              fontColor: whiteColor,
            ),
            TextFormat(
              "Mau masak apa hari ini ?",
              fontSize: 32.ssp,
              fontColor: Colors.white70,
            ),
          ],
        ),
      ),
    );
  }
}
