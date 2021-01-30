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
                                top: 100.h,
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
    return Column(
      children: [
        RecipeList(controller.listRecipes),
        SizedBox(height: 40.h)
      ],
    );
  }
}
