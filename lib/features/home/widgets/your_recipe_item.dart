import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe/core/routing/routes.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/data/models/recipe/recipe_model.dart';
import 'package:recipe/features/common/common.dart';

class YourRecipeItem extends StatelessWidget {
  const YourRecipeItem({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(Routes.getRecipeDetail(recipe.id)),
      child: Center(
        child: SizedBox(
          width: 169.w,
          height: 190.h,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: CachedNetworkImage(
                  imageUrl: recipe.photo,
                  width: 169.w,
                  height: 162.h,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 7.h,
                right: 8.w,
                child: RecipeIconButtonContainer(
                  image: 'assets/icons/heart.svg',
                  callback: () {},
                  iconColor: Colors.white,
                  containerColor: Theme.of(context).colorScheme.primary,
                  iconWidth: 16,
                  iconHeight: 15,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 169.w,
                  height: 48.h,
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.25),
                        offset: Offset(0, 4),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.title,
                        style: TextStyle(
                          color: AppColors.beigeColor,
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        spacing: 25.w,
                        children: [
                          RecipeRating(rating: recipe.rating),
                          RecipeTime(timeRequired: recipe.timeRequired),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
