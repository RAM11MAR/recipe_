import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/data/models/recipe/user_model_in_recipe.dart';

import '../../common/widgets/recipe_text_button_container.dart';

class RecipeDetailUserSection extends StatelessWidget {
  const RecipeDetailUserSection({
    super.key,
    required this.user,
  });

  final UserModelInRecipe user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(31),
          child: Image.network(
            user.image,
            width: 62,
            height: 62,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "@${user.username}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.redPinkMain,
                  fontSize: 12,
                ),
              ),
              Text(
                "${user.firstName} ${user.lastName}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'League Spartan',
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
        RecipeTextButtonContainer(
          text: "Following",
          containerColor: AppColors.pink,
          textColor: AppColors.pinkSub,
          containerHeight: 22,
          callback: (){},
        ),
        SizedBox(width: 10),
        SvgPicture.asset(
          "assets/icons/three_dots.svg",
          colorFilter: ColorFilter.mode(AppColors.redPinkMain, BlendMode.srcIn),
        ),
      ],
    );
  }
}
