part of 'widgets.dart';

Widget recipeItem(Recipe recipe) {
  return Hero(
    tag: recipe.key,
    child: GestureDetector(
      onTap: () {
        Get.toNamed('/detailrecipe', arguments: recipe);
      },
      child: Container(
        margin: EdgeInsets.only(left: 32.w, right: 32.w, top: 54.h),
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
            boxShadow: boxShadowBottom,
            color: inputBackgroundColor,
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
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
            ),
            SizedBox(height: 12.h),
            TextFormat(
              recipe.title,
              maxLine: 3,
              textAlign: TextAlign.center,
              fontSize: 34.ssp,
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
      ),
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
      ),
    ],
  );
}
