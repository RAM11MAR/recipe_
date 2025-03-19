import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:recipe/features/common/common.dart';

import '../../common/widgets/recipe_app_bar_bottom.dart';
import '../manager/category_detail_view_model.dart';
import 'category_detail_view_body.dart';

class CategoryDetailView extends StatelessWidget {
  const CategoryDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailBloc, CategoryDetailState>(
      builder: (context, state) {
        return switch (state.status) {
          CategoryDetailStatus.loading => Center(child: CircularProgressIndicator()),
          CategoryDetailStatus.error => Center(child: Text("Something went wrong...")),
          CategoryDetailStatus.idle => Scaffold(
              extendBody: true,
              appBar: RecipeAppBar(
                title: state.selected!.title,
                actions: [
                  RecipeIconButtonContainer(
                    image: "assets/icons/notification.svg",
                    iconWidth: 14,
                    iconHeight: 19,
                    callback: () {},
                  ),
                  SizedBox(width: 5),
                  RecipeIconButtonContainer(
                    image: "assets/icons/search.svg",
                    iconWidth: 12,
                    iconHeight: 18,
                    callback: () {},
                  ),
                ],
                bottom: RecipeAppBarBottom(),
              ),
              body: CategoryDetailViewBody(),
              bottomNavigationBar: RecipeBottomNavigationBar(),
            ),
        };
      },
    );
  }
}
