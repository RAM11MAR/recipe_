import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/data/models/recipe/recipe_model.dart';
import 'package:recipe/features/home/widgets/your_recipe_item.dart';

import '../manager/home_view_model.dart';

class YourRecipesSection extends StatelessWidget {
  const YourRecipesSection({
    super.key,
    required this.title,
    required this.recipes,
  });

  final String title;
  final List<RecipeModel> recipes;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 255.h,
      padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var recipe in recipes)
                YourRecipeItem(recipe: recipe),
            ],
          ),
        ],
      ),
    );
  }
}
