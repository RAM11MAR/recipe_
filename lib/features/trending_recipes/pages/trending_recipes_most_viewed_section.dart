import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/common/common.dart';
import 'package:recipe/features/home/widgets/trending_recipe_item.dart';
import 'package:recipe/features/trending_recipes/manager/trending_recipes_bloc.dart';
import 'package:recipe/features/trending_recipes/manager/trending_recipes_state.dart';

class TrendingRecipesMostViewedSection extends StatelessWidget {
  const TrendingRecipesMostViewedSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingRecipesBloc, TrendingRecipesState>(
      builder:(context, state) =>  Container(
        padding: EdgeInsets.fromLTRB(36.w, 9.h, 36.w, 18.h),
        width: double.infinity,
        height: 241.h,
        decoration: BoxDecoration(
          color: AppColors.redPinkMain,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          spacing: 5.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Most Viewed Today",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            TrendingRecipeItem(
              trendingRecipe: state.mostViewed!,
              color: Colors.white,
              titleColor: Colors.black,
              descriptionColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}