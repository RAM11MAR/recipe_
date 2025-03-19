import 'package:flutter/material.dart';
import 'package:recipe/core/utils/colors.dart';

class RecipeAppBarBottomItem extends StatelessWidget {
  const RecipeAppBarBottomItem({
    super.key,
    required this.title,
    required this.callback,
    required this.isSelected,
  });

  final bool isSelected;

  final String title;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.redPinkMain : Colors.transparent,
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextButton(
        onPressed: callback,
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.redPinkMain,
            fontSize: 16,
            fontFamily: "League Spartan",
          ),
        ),
      ),
    );
  }
}
