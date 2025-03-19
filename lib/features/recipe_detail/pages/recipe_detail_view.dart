import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/common/common.dart';
import 'package:recipe/features/recipe_detail/widgets/instruction_item.dart';

import '../manager/recipe_detail_view_model.dart';
import '../widgets/recipe_detail_image_and_video.dart';
import '../widgets/recipe_detail_user_section.dart';

class RecipeDetailView extends StatelessWidget {
  const RecipeDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<RecipeDetailViewModel>();
    if (vm.isLoading) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        extendBody: true,
        appBar: RecipeAppBar(
          title: vm.recipe.title,
          actions: [
            RecipeIconButtonContainer(
              image: "assets/icons/heart.svg",
              iconWidth: 16,
              iconHeight: 15,
              callback: () {},
            ),
            SizedBox(width: 5),
            RecipeIconButtonContainer(
              image: "assets/icons/share.svg",
              iconWidth: 12,
              iconHeight: 18,
              callback: () {},
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 36.w),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    RecipeDetailImageAndVideo(),
                    SizedBox(height: 20),
                    RecipeDetailUserSection(user: vm.recipe.user),
                    SizedBox(height: 20),
                    Divider(color: AppColors.redPinkMain),
                    SizedBox(height: 20),
                    Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          spacing: 15,
                          children: [
                            Text(
                              'Details',
                              style: TextStyle(
                                color: AppColors.redPinkMain,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            RecipeTime(
                              timeRequired: vm.recipe.timeRequired,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Text(
                          vm.recipe.description,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Ingredients',
                      style: TextStyle(
                        color: AppColors.redPinkMain,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var ingredient in vm.recipe.ingredients)
                          Row(
                            spacing: 3,
                            children: [
                              Icon(Icons.circle,
                                  size: 6, color: AppColors.redPinkMain),
                              if (ingredient.amount != null)
                                Text(
                                  ingredient.amount!,
                                  style:
                                      TextStyle(color: AppColors.redPinkMain),
                                ),
                              Text(ingredient.name),
                            ],
                          ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      spacing: 11.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        vm.recipe.instructions.length,
                        (index) => InstructionItem(instruction: vm.recipe.instructions[index], index: index),
                      ),
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      );
    }
  }
}
