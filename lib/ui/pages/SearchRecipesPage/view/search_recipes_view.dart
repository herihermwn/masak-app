part of '../../pages.dart';

class SearchRecipesView extends StatelessWidget {
  final controller = Get.find<SearchRecipesController>();

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
        child: Column(
          children: [
            header(),
            body(),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Hero(
              tag: "SearchBar",
              child: Icon(Icons.arrow_back_ios),
            ),
          ),
          Container(
            width: 0.48.sh,
            margin: EdgeInsets.symmetric(vertical: 30.h),
            child: TextField(
              autofocus: true,
              onSubmitted: (value) => controller.submitQuery(),
              controller: controller.query,
              decoration: InputDecoration(
                fillColor: inputBackgroundColor,
                filled: true,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 16.h,
                  horizontal: 20.w,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: inputBackgroundColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: GestureDetector(
                  onTap: () => controller.clearQuery(),
                  child: Icon(
                    Icons.clear,
                    size: 40.w,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget body() {
    return Obx(
      () {
        return controller.getLatestRecipesDone.isfalse
            ? loadingWidget()
            : controller.doSearch.isfalse
                ? newRecipes()
                : controller.searchRecipesDone.isfalse
                    ? loadingWidget()
                    : controller.failedRequest.isfalse
                        ? resultSearchRecipes()
                        : retryWidget();
      },
    );
  }

  Widget newRecipes() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            child: TextFormat(
              "Resep Terbaru :",
              fontWeight: FontWeight.bold,
              fontSize: 36.ssp,
            ),
          ),
          RecipeList(controller.newRecipes),
        ],
      ),
    );
  }

  Widget resultSearchRecipes() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            child: TextFormat(
              "Hasil pencarian kata ${controller.query.text} :",
              fontWeight: FontWeight.bold,
              fontSize: 36.ssp,
            ),
          ),
          RecipeList(controller.searchRecipes),
        ],
      ),
    );
  }

  Widget retryWidget() {
    return Center(
      child: Container(
        width: 0.4.sh,
        padding: EdgeInsets.symmetric(vertical: 40.h),
        margin: EdgeInsets.only(top: 100.h),
        decoration: BoxDecoration(
          color: inputBackgroundColor,
          boxShadow: boxShadowBottom,
        ),
        child: Column(
          children: [
            Icon(
              Icons.error,
              size: 100.w,
              color: Colors.red,
            ),
            TextFormat(
              "Mohon maaf, terjadi kesalahan permintaan",
              maxLine: 4,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.h),
            RaisedButton(
              onPressed: controller.retrySearch,
              color: greenColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.h),
                child: TextFormat(
                  "Coba Lagi",
                  fontColor: whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget loadingWidget() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          top: 100.h,
        ),
        child: CircularProgressIndicator(),
      ),
    );
  }
}
