import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:masak_app/core/models/models.dart';
import 'package:masak_app/services/services.dart';
import 'package:masak_app/ui/shared/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masak_app/ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

/// [Binding]
part 'SplashScreen/binding/splash_binding.dart';
part 'HomePage/binding/home_binding.dart';
part 'RecipesByCategoryPage/binding/recipes_by_category_binding.dart';
part 'DetailRecipePage/binding/detail_recipe_binding.dart';
part 'SearchRecipesPage/binding/search_recipes_binding.dart';

/// [Controller]
part 'SplashScreen/controller/splash_controller.dart';
part 'HomePage/controller/home_controller.dart';
part 'RecipesByCategoryPage/controller/recipes_by_category_controller.dart';
part 'DetailRecipePage/controller/detail_recipe_controller.dart';
part 'SearchRecipesPage/controller/search_recipes_controller.dart';

/// [View]
part 'SplashScreen/view/splash_view.dart';
part 'HomePage/view/home_view.dart';
part 'RecipesByCategoryPage/view/recipes_by_category_view.dart';
part 'DetailRecipePage/view/detail_recipe_view.dart';
part 'SearchRecipesPage/view/search_recipes_view.dart';