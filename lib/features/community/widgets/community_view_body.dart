import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/core/utils/colors.dart';

import '../manager/community_cubit.dart';
import 'community_recipe_item.dart';

class CommunityViewBody extends StatelessWidget {
  const CommunityViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunityCubit, CommunityState>(
      builder: (context, state) {
        if (state.status == CommunityStatus.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.status == CommunityStatus.idle) {
          return ListView.separated(
            padding: EdgeInsets.fromLTRB(36.w, 20.h, 36.w, 100.h),
            itemCount: state.communityRecipes.length,
            separatorBuilder: (context, index) => Divider(
              thickness: 1,
              color: AppColors.pinkSub,
              height: 28,
            ),
            itemBuilder: (context, index) => CommunityRecipeItem(
              recipe: state.communityRecipes[index],
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
