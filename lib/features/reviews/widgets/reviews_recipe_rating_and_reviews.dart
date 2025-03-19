import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe/data/models/recipe/reviews_recipe_model.dart';

class ReviewsRecipeRatingAndReviews extends StatelessWidget {
  const ReviewsRecipeRatingAndReviews({
    super.key,
    required this.rating,
    required this.reviews,
  });

  final num rating;
  final int reviews;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Row(
          spacing: 3,
          children: List.generate(
            5,
            (index) {
              if (index + 1 <= rating.toInt()) {
                return SvgPicture.asset('assets/icons/star-filled.svg');
              } else {
                return SvgPicture.asset('assets/icons/star-empty.svg');
              }
            },
          ),
        ),
        Text(
          "($reviews Review${reviews != 1 ? 's' : ''})",
          style: TextStyle(
            color: Colors.white,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}
