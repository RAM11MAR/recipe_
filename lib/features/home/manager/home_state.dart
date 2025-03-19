part of 'home_view_model.dart';

enum HomeStatus { idle, loading, error }

@immutable
class HomeState extends Equatable {
  const HomeState({
    required this.status,
    required this.categories,
    required this.yourRecipes,
    required this.trendingRecipe,
    required this.topChefs,
    required this.recentlyAddedRecipes,
  });

  final HomeStatus status;
  final List<CategoryModel> categories;
  final List<RecipeModel> yourRecipes;
  final RecipeModel? trendingRecipe;
  final List<TopChefModelSmall> topChefs;
  final List<RecipeModel> recentlyAddedRecipes;

  @override
  List<Object?> get props => [
        status,
        categories,
        yourRecipes,
        trendingRecipe,
        topChefs,
        recentlyAddedRecipes,
      ];
}
