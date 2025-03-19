import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/data/models/recipe/recipe_model.dart';

import '../manager/category_detail_view_model.dart';
import '../widgets/recipe_item/recipe_item.dart';

class CategoryDetailViewBody extends StatelessWidget {
  const CategoryDetailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailBloc, CategoryDetailState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          transitionBuilder: (child, animation) {
            Animation<Offset> slideInAnimation = Tween<Offset>(
              begin: Offset(state.right ? 1.0 : -1.0, 0.0),
              end: Offset(0.0, 0.0),
            ).animate(animation);

            Animation<Offset> slideOutAnimation = Tween<Offset>(
              begin: Offset(state.right ? -1.0 : 1.0, 0.0),
              end: Offset(0.0, 0.0),
            ).animate(animation);

            if (child.key == ValueKey<List<RecipeModel>>(state.recipes)) {
              return SlideTransition(position: slideInAnimation, child: child);
            } else {
              return SlideTransition(position: slideOutAnimation, child: child);
            }
          },
          child: GridView.builder(
            key: ValueKey<List<RecipeModel>>(state.recipes),
            padding: EdgeInsets.fromLTRB(16, 36, 16, 120),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 226,
              mainAxisSpacing: 30,
            ),
            itemCount: state.recipes.length,
            itemBuilder: (context, index) => RecipeItem(recipe: state.recipes[index]),
          ),
        );
      },
    );
  }
}
