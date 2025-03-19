import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/data/models/recipe/recipe_model.dart';
import 'package:recipe/features/home/widgets/trending_recipe_item.dart';

class TrendingRecipeSection extends StatelessWidget {
  const TrendingRecipeSection({
    super.key,
    required this.trendingRecipe,
  });

  final RecipeModel trendingRecipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36.w),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Trending Recipe",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          TrendingRecipeItem(trendingRecipe: trendingRecipe),
        ],
      ),
    );
  }
}
