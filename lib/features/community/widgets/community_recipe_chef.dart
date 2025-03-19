import 'package:flutter/material.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/data/models/recipe/community_recipe_model.dart';

class CommunityRecipeChef extends StatelessWidget {
  const CommunityRecipeChef({
    super.key,
    required this.recipe,
  });

  final CommunityRecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    final timeDifference = DateTime.now().difference(recipe.created);
    final timePassed = timeDifference.inDays;
    return Row(
      spacing: 15,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.network(recipe.user.image, width: 35, height: 35),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "@${recipe.user.username}",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            Text(
              "$timePassed days ago",
              style: TextStyle(
                color: AppColors.pinkSub,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
