import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/common/widgets/recipe_text_button_container.dart';

import '../manager/community_cubit.dart';

class CommunityAppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  const CommunityAppBarBottom({super.key});

  @override
  Size get preferredSize => Size(double.infinity, 45);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CommunityCubit, CommunityState, int>(
      selector: (state) => state.selectedIndex,
      builder: (context, selectedIndex) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RecipeTextButtonContainer(
            text: "Top Recipes",
            textColor: selectedIndex == 0 ? Colors.white : AppColors.redPinkMain,
            containerColor: selectedIndex == 0 ? AppColors.redPinkMain : Colors.transparent,
            containerHeight: 25,
            fontSize: 16,
            fontWeight: FontWeight.normal,
            callback: () async => await context.read<CommunityCubit>().selectOrderBy(0),
          ),
          RecipeTextButtonContainer(
            text: "Newest",
            containerColor: selectedIndex == 1 ? AppColors.redPinkMain : Colors.transparent,
            containerHeight: 25,
            textColor: selectedIndex == 1 ? Colors.white : AppColors.redPinkMain,
            fontSize: 16,
            fontWeight: FontWeight.normal,
            callback: () async => await context.read<CommunityCubit>().selectOrderBy(1),
          ),
          RecipeTextButtonContainer(
            text: "Oldest",
            containerColor: selectedIndex == 2 ? AppColors.redPinkMain : Colors.transparent,
            containerHeight: 25,
            textColor: selectedIndex == 2 ? Colors.white : AppColors.redPinkMain,
            fontSize: 16,
            fontWeight: FontWeight.normal,
            callback: () async => await context.read<CommunityCubit>().selectOrderBy(2),
          ),
        ],
      ),
    );
  }
}
