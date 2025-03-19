import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/data/models/recipe/reviews_recipe_model.dart';
import 'package:recipe/data/models/recipe/user_model_in_recipe.dart';

class ReviewsRecipeItemUser extends StatelessWidget {
  const ReviewsRecipeItemUser({
    super.key,
    required this.user,
  });

  final UserModelInRecipe user;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(17.w),
          child: CachedNetworkImage(
            imageUrl: user.image,
            width: 34.w,
            height: 34.h,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "@${user.username}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            Text(
              "${user.firstName} ${user.lastName}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: "League Spartan",
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
