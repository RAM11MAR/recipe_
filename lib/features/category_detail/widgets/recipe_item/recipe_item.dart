import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe/core/routing/routes.dart';
import 'package:recipe/data/models/recipe/recipe_model.dart';
import 'package:recipe/features/common/common.dart';

import 'recipe_item_image.dart';
import 'recipe_item_info.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>context.push(Routes.getRecipeDetail(recipe.id)),
      child: Center(
        child: SizedBox(
          width: 169,
          height: 226,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              RecipeItemInfo(recipe: recipe),
              RecipeItemImage(image: recipe.photo),
              Positioned(
                top: 7,
                right: 8,
                child: RecipeIconButtonContainer(
                  image: "assets/icons/heart.svg",
                  callback: () {},
                  iconWidth: 16,
                  iconHeight: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
