import 'package:flutter/material.dart';
import 'package:recipe/features/common/common.dart';
import 'package:recipe/features/community/widgets/community_app_bar_bottom.dart';
import 'package:recipe/features/community/widgets/community_view_body.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBar(
        title: "Community",
        actions: [
          RecipeIconButtonContainer(
            image: 'assets/icons/notification.svg',
            callback: () {},
            iconWidth: 14,
            iconHeight: 19,
          ),
          SizedBox(width: 5),
          RecipeIconButtonContainer(
            image: 'assets/icons/search.svg',
            callback: () {},
            iconWidth: 14,
            iconHeight: 19,
          ),
        ],
        bottom: CommunityAppBarBottom(),
      ),
      body: CommunityViewBody(),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
