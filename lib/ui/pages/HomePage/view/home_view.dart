part of '../../pages.dart';

class HomeView extends StatelessWidget {
  final controller = Get.find<HomeController>();

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
      body: Obx(
        () {
          return controller.isDone.isfalse
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      header(),
                      categoryRecipes(),
                    ],
                  ),
                );
        },
      ),
    );
  }

  Widget header() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed('/searchrecipes');
          },
          child: Container(
            margin: EdgeInsets.only(
              top: 60.h,
              bottom: 12.h,
              right: 42.w,
              left: 42.w,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 16.h,
              horizontal: 20.w,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: greenColor),
              color: inputBackgroundColor,
            ),
            child: Row(
              children: [
                Hero(tag: "SearchBar", child: Icon(Icons.search)),
                SizedBox(width: 20.w),
                TextFormat(
                  "Cari Resep",
                  fontSize: 34.ssp,
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 42.h),
          child: TextFormat(
            "Resep pilihan untukmu hari ini",
            fontWeight: FontWeight.bold,
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
              height: 500.h,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 5),
              autoPlayAnimationDuration: Duration(milliseconds: 500),
              autoPlayCurve: Curves.easeInOut,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              enlargeCenterPage: true),
          items: controller.randomRecipes.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed('/detailrecipe', arguments: i);
                  },
                  child: Hero(
                    tag: i.key,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: CachedNetworkImage(
                            imageUrl: i.thumb,
                            width: 430.w,
                            fit: BoxFit.fitHeight,
                            placeholder: (context, child) {
                              return Container(
                                width: 200.w,
                                height: 200.w,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            },
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 12.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: greenColor,
                          ),
                          child: TextFormat(
                            i.title,
                            fontSize: 30.sp,
                            textAlign: TextAlign.center,
                            fontColor: whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget categoryRecipes() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 12.h),
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
          child: TextFormat(
            "Kategori Resep",
            fontWeight: FontWeight.bold,
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.listCategory.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(
                  "/recipesbycategory",
                  arguments: controller.listCategory[index],
                );
              },
              child: Hero(
                tag: controller.listCategory[index].key,
                child: Stack(
                  alignment: Alignment(0, 0),
                  children: [
                    CachedNetworkImage(
                      imageUrl: controller.listCategory[index].url,
                      height: 250.h,
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
                        controller.listCategory[index].category,
                        fontColor: whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(height: 30.h),
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}
