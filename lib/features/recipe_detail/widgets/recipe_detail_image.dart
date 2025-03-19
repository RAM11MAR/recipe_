import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeDetailImage extends StatelessWidget {
  const RecipeDetailImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Hero(
        tag: "recipe_image",
        child: CachedNetworkImage(
          imageUrl: image,
          width: 357.w,
          height: 281.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
