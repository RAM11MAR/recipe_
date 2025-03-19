import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecipeReviews extends StatelessWidget {
  const RecipeReviews({
    super.key,
    required this.reviews,
    this.swap = false,
  });

  final int reviews;
  final bool swap;

  @override
  Widget build(BuildContext context) {
    final icon = SvgPicture.asset("assets/icons/reviews.svg");
    final text = Text(reviews.toString(), style: TextStyle(fontSize: 12));
    return Row(
      spacing: 5,
      children: [
        swap ? text : icon,
        swap ? icon : text,
      ],
    );
  }
}
