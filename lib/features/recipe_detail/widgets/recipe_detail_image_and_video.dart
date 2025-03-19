import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/common/common.dart';

import '../manager/recipe_detail_view_model.dart';
import '../pages/recipe_detail_video.dart';
import 'recipe_detail_image.dart';
import 'recipe_detail_title_and_stats.dart';

class RecipeDetailImageAndVideo extends StatelessWidget {
  const RecipeDetailImageAndVideo({super.key});

  @override
  Widget build(BuildContext context) {
    final recipe = context.select((RecipeDetailViewModel vm) => vm.recipe);
    return Center(
      child: SizedBox(
        width: 357.w,
        height: 337.h,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            RecipeDetailTitleAndStats(
              title: recipe.title,
              rating: recipe.rating,
              reviews: recipe.reviewsCount,
              recipeId: recipe.id,
            ),
            RecipeDetailImage(image: recipe.image),
            Positioned(
              top: 100.h,
              child: RecipeIconButtonContainer(
                image: "assets/icons/play.svg",
                callback: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RecipeDetailVideo(
                      videoUrl: recipe.videoRecipe,
                    ),
                  ),
                ),
                iconWidth: 30,
                iconHeight: 40,
                containerWidth: 74,
                containerHeight: 74,
                containerColor: AppColors.redPinkMain,
                iconColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
