import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/features/common/common.dart';
import 'package:recipe/features/trending_recipes/manager/trending_recipes_bloc.dart';
import 'package:recipe/features/trending_recipes/manager/trending_recipes_state.dart';
import 'package:recipe/features/trending_recipes/pages/trending_recipes_most_viewed_section.dart';

class TrendingRecipesView extends StatelessWidget {
  const TrendingRecipesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingRecipesBloc, TrendingRecipesState>(
      builder: (context, state) {
        return switch (state.status) {
          null => throw Text("Null"),
          TrendingRecipesStatus.loading => Center(child: CircularProgressIndicator()),
          TrendingRecipesStatus.error => Center(child: Text("Xato!")),
          TrendingRecipesStatus.idle => Scaffold(
            appBar: RecipeAppBar(
              title: "Trending Recipes",
              actions: [
                RecipeIconButtonContainer(
                  image: "assets/icons/notification.svg",
                  callback: () {},
                  iconWidth: 12.w,
                  iconHeight: 17.h,
                ),
                SizedBox(width: 5),
                RecipeIconButtonContainer(
                  image: "assets/icons/search.svg",
                  callback: () {},
                  iconWidth: 12.w,
                  iconHeight: 17.h,
                ),
              ],
            ),
            extendBody: true,
            body: Column(
              children: [
                TrendingRecipesMostViewedSection(),
              ],
            ),
            bottomNavigationBar: RecipeBottomNavigationBar(),
          ),
        };
      },
    );
  }
}