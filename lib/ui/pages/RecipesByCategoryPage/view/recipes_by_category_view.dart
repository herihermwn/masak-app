part of '../../pages.dart';

class RecipesByCategoryView extends StatelessWidget {
  final controller = Get.find<RecipesByCategoryController>();

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
                    return controller.isDone.isfalse
                        ? Center(
                            child: Container(
                              margin: EdgeInsets.only(
                                top: 80.h,
                              ),
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : recipesList();
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
                    color: darkTextColor,
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
      tag: controller.category.key,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          CachedNetworkImage(
            imageUrl: controller.category.url,
            height: 350.h,
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
          Container(
            padding: EdgeInsets.all(12.h),
            margin: EdgeInsets.all(12.h),
            decoration: BoxDecoration(
              color: greenColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormat(
              controller.category.category,
              fontColor: whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget recipesList() {
    return Container(
      height: 700.h * controller.listRecipes.length,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.listRecipes.length,
        itemBuilder: (context, index) {
          var recipe = controller.listRecipes[index];
          return Container(
            margin: EdgeInsets.only(left: 32.w, right: 32.w, top: 54.h),
            padding: EdgeInsets.all(16.h),
            decoration: BoxDecoration(
              boxShadow: boxShadowBottom,
              color: inputBackgroundColor,
              borderRadius: BorderRadius.circular(8)
            ),
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: recipe.thumb,
                  width: 600.w,
                  height: 400.h,
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
                SizedBox(height: 12.h),
                TextFormat(
                  controller.listRecipes[index].title,
                  maxLine: 3,
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    specBox(MdiIcons.alarm, recipe.times),
                    specBox(MdiIcons.bowlMix, recipe.portion),
                    specBox(MdiIcons.chefHat, recipe.dificulty),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget specBox(IconData icon, String spec) {
    return Row(
      children: [
        Icon(
          icon,
          color: greenColor,
        ),
        TextFormat(
          spec,
          fontColor: darkTextColor,
          fontSize: 32.ssp,
          maxLine: 3,
        ),
      ],
    );
  }
}
