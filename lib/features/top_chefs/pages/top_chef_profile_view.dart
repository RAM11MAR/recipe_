import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/common/common.dart';
import 'package:recipe/features/common/widgets/recipe_eleveted_button.dart';
import 'package:recipe/features/top_chefs/widgets/following.dart';

import '../widgets/favorite_item.dart';

class TopChefProfileView extends StatelessWidget {
  const TopChefProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RecipeAppBar(
        title: "@Neil_tran",
        actions: [
          RecipeIconButtonContainer(
            image: "assets/icons/share.svg",
            callback: () {},
            iconWidth: 15.w,
            iconHeight: 16.h,
          ),
          SizedBox(width: 5.w),
          RecipeIconButtonContainer(
            image: "assets/icons/three_dots.svg",
            callback: () {},
            iconWidth: 4.w,
            iconHeight: 16.h,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 200.h),
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                spacing: 10,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "assets/icons/breakfast.png",
                      width: 102.w,
                      height: 97.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 24.h,
                        child: Text(
                          "Neil Tran-Chef",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.redPinkMain,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 200.w,
                        height: 37.h,
                        child: Text(
                          "Passionate chef in creative and contemporary cuisine.",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      RecipeElevatedButton(
                        text: "Following",
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        callback: () {},
                        size: Size(81.w, 19.h),
                      ),
                    ],
                  ),
                ],
              ),
              Following(),
              Column(
                children: [
                  Text("Recipes"),
                  Divider(color: AppColors.redPinkMain,),
                ],
              ),
            ],
          ),
        ),
      ),
      extendBody: true,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 1.h),
        children: [
          FavoritesItem(title: "Vegan", image: "assets/icons/vegan.png"),
        ],
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}