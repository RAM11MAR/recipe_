import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/common/common.dart';

import '../../../data/models/recipe/recipe_model.dart';
import '../../common/widgets/recipe_rating.dart';
import '../../common/widgets/recipe_time.dart';

class TrendingRecipeItem extends StatelessWidget {
  const TrendingRecipeItem({
    super.key,
    required this.trendingRecipe,
    this.color = Colors.transparent,
    this.titleColor = Colors.white,
    this.descriptionColor = Colors.white,
  });

  final RecipeModel trendingRecipe;
  final Color color, titleColor, descriptionColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 183.h,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 348.w,
                height: 49.h,
                padding: EdgeInsets.only(
                  right: 15.w,
                  left: 15.w,
                ),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(14),
                    bottomLeft: Radius.circular(14),
                  ),
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
                            style: TextStyle(
                              fontSize: 13,
                              color: titleColor,
                            ),
                          ),
                        ),
                        RecipeTime(
                          timeRequired: trendingRecipe.timeRequired,
                          color: AppColors.pinkSub,
                          iconColor: AppColors.pinkSub,
                        ),
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
                              color: descriptionColor,
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
            Positioned(
              top: 7,
              right: 7,
              child: RecipeIconButtonContainer(
                image: "assets/icons/heart.svg",
                callback: (){},
                iconWidth: 16,
                iconHeight: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}