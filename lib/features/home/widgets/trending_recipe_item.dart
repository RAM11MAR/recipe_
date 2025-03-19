import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/data/models/recipe/recipe_model.dart';
import 'package:recipe/features/common/common.dart';

class TrendingRecipeItem extends StatelessWidget {
  const TrendingRecipeItem({
    super.key,
    required this.trendingRecipe,
  });

  final RecipeModel trendingRecipe;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 180.h,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 348.w,
                height: 49.h,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.pinkSub, width: 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            trendingRecipe.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                        RecipeTime(timeRequired: trendingRecipe.timeRequired)
                      ],
                    ),
                    Row(
                      spacing: 40,
                      children: [
                        Expanded(
                          child: Text(
                            trendingRecipe.description,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'League Spartan',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        RecipeRating(rating: trendingRecipe.rating),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: CachedNetworkImage(
                imageUrl: trendingRecipe.photo,
                height: 143.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
