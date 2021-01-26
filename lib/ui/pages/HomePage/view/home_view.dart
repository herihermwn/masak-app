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
        Container(
          margin: EdgeInsets.only(
            top: 46.h,
            bottom: 12.h,
            right: 42.w,
            left: 42.w,
          ),
          child: Row(
            children: [
              Icon(Icons.search),
              TextFormat("Cari resep"),
            ],
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
                return Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: i.thumb,
                      width: 450.w,
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
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
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
          margin: EdgeInsets.only(
            bottom: 12.h,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 32.w,
            vertical: 16.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
          ),
          child: TextFormat(
            "Kategori Resep",
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 280.h * controller.listCategory.length,
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.listCategory.length,
            itemBuilder: (context, index) {
              return Stack(
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
                  Align(
                    alignment: Alignment(0, 0),
                    child: Container(
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
                  )
                ],
              );
            },
            separatorBuilder: (context, index) => Divider(height: 30.h),
          ),
        ),
      ],
    );
  }
}
