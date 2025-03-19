import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe/core/routing/routes.dart';
import 'package:recipe/data/models/category_model.dart';

import '../../manager/home_view_model.dart';
import 'recipe_app_bar_bottom_item.dart';

class RecipeAppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  const RecipeAppBarBottom({super.key, required this.categories});

  final List<CategoryModel> categories;

  @override
  Size get preferredSize => const Size(double.infinity, 60);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 10,
        children: [
          for (var category in categories)
            RecipeAppBarBottomItem(
              title: category.title,
              callback: () => context.push(Routes.getCategoryDetail(category.id)),
              isSelected: false,
            ),
        ],
      ),
    );
  }
}
