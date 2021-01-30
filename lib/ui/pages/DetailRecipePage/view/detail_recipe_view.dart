part of '../../pages.dart';

class DetailRecipeView extends StatelessWidget {
  final controller = Get.find<DetailRecipeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: greenColor,
          brightness: Brightness.dark,
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                header(),
                Obx(
                  () {
                    return AnimatedSwitcher(
                      duration: Duration(milliseconds: 500),
                      transitionBuilder: (child, animation) => ScaleTransition(
                        scale: animation,
                        child: child,
                      ),
                      child: controller.isDone.isfalse
                          ? Center(
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: 100.h,
                                ),
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : detailRecipe(),
                    );
                  },
                ),
              ],
            ),
            Align(
              alignment: Alignment(-0.95, 0),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: 80.w,
                  height: 80.w,
                  margin: EdgeInsets.only(top: 20.h),
                  decoration: BoxDecoration(
                    color: darkTextColor.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.navigate_before,
                    color: whiteColor,
                    size: 80.w,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Hero(
      tag: controller.recipe.key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CachedNetworkImage(
              imageUrl: controller.recipe.thumb,
              height: 450.h,
              width: 720.w,
              fit: BoxFit.cover,
              placeholder: (context, child) {
                return Container(
                  width: 250.w,
                  height: 250.w,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.h),
            child: TextFormat(
              controller.recipe.title,
              fontWeight: FontWeight.bold,
              fontSize: 36.ssp,
              maxLine: 3,
            ),
          ),
        ],
      ),
    );
  }

  Widget detailRecipe() {
    Author author = controller.detailRecipe.author;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormat(
            "By ${author.user}, ${author.datePublished}",
            fontSize: 28.ssp,
            textAlign: TextAlign.start,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              specBox(MdiIcons.alarm, controller.recipe.times),
              specBox(MdiIcons.bowlMix, controller.recipe.portion),
              specBox(MdiIcons.chefHat, controller.recipe.dificulty),
            ],
          ),
          ingredientBox(),
          stepBox(),
          descBox()
        ],
      ),
    );
  }

  Widget ingredientBox() {
    List<String> ingredient = controller.detailRecipe.ingredient;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 32.h),
        TextFormat(
          "Bahan : ",
          fontWeight: FontWeight.bold,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: ingredient.length,
          itemBuilder: (context, index) {
            return textBox("* ${ingredient[index]}", 2.h);
          },
        ),
      ],
    );
  }

  Widget stepBox() {
    List<String> step = controller.detailRecipe.step;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 32.h),
        TextFormat(
          "Langkah - langkah : ",
          fontWeight: FontWeight.bold,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: step.length,
          itemBuilder: (context, index) {
            return textBox("${step[index]}", 8.h);
          },
        ),
      ],
    );
  }

  Widget descBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40.h),
        TextFormat(
          "Deskripsi : ",
          fontWeight: FontWeight.bold,
        ),
        textBox(controller.detailRecipe.desc, 8.h),
        SizedBox(height: 32.h),
      ],
    );
  }

  Widget specBox(IconData icon, String spec) {
    return Container(
      margin: EdgeInsets.only(top: 24.h),
      width: 180.w,
      height: 160.w,
      decoration: BoxDecoration(
        color: greenColor,
        boxShadow: boxShadowBottom,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: whiteColor,
          ),
          TextFormat(
            spec,
            fontColor: whiteColor,
            fontSize: 30.ssp,
            maxLine: 1,
          ),
        ],
      ),
    );
  }

  Widget textBox(String text, double margin) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: margin),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: inputBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextFormat(
        text,
        maxLine: 100,
        fontSize: 34.ssp,
      ),
    );
  }
}
