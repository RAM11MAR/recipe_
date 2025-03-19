import 'package:recipe/core/client.dart';
import 'package:recipe/data/models/recipe/community_recipe_model.dart';
import 'package:recipe/data/models/recipe/recipe_create_review_model.dart';
import 'package:recipe/data/models/recipe/recipe_model.dart';
import 'package:recipe/data/models/recipe/reviews_recipe_model.dart';

import '../models/recipe/recipe_detail_model.dart';

class RecipeRepository {
  RecipeRepository({required this.client});

  final ApiClient client;

  Map<int, List<RecipeModel>> recipesByCategory = {};
  RecipeDetailModel? recipe;

  List<CommunityRecipeModel> communityRecipes = [];
  List<RecipeModel> recentlyAddedRecipes = [];

  ReviewsRecipeModel? reviewsRecipe;

  Future<List<RecipeModel>> fetchRecipesByCategory(int categoryId) async {
    if (recipesByCategory.containsKey(categoryId) && recipesByCategory[categoryId] != null) {
      return recipesByCategory[categoryId]!;
    }

    var rawRecipes = await client.fetchRecipesByCategory(categoryId);
    final recipes = rawRecipes.map((recipe) => RecipeModel.fromJson(recipe)).toList();
    recipesByCategory[categoryId] = recipes;
    return recipes;
  }

  Future<RecipeDetailModel> fetchRecipeById(int recipeId) async {
    final rawRecipe = await client.fetchRecipeById(recipeId);
    recipe = RecipeDetailModel.fromJson(rawRecipe);
    return recipe!;
  }

  Future<RecipeModel> fetchTrendingRecipe() async {
    var rawRecipe = await client.fetchTrendingRecipe();
    return RecipeModel.fromJson(rawRecipe);
  }

  Future<List<RecipeModel>> fetchYourRecipes({int? limit}) async {
    final rawRecipes = await client.fetchYourRecipes(limit: limit);
    return rawRecipes.map((recipe) => RecipeModel.fromJson(recipe)).toList();
  }

  Future<List<CommunityRecipeModel>> fetchCommunityRecipes({required String orderBy, required bool descending}) async {
    final rawRecipes = await client.fetchCommunityRecipes(orderBy: orderBy, descending: descending);
    communityRecipes = rawRecipes.map((recipe) => CommunityRecipeModel.fromJson(recipe)).toList();
    return communityRecipes;
  }

  Future<List<RecipeModel>> fetchRecentlyAddedRecipes({int? limit}) async {
    final rawRecipes = await client.fetchRecentlyAddedRecipes(limit: limit);
    recentlyAddedRecipes = rawRecipes.map((recipe) => RecipeModel.fromJson(recipe)).toList();
    return recentlyAddedRecipes;
  }

  Future<ReviewsRecipeModel> fetchRecipeForReviews(int recipeId) async {
    var rawRecipe = await client.fetchRecipeForReviews(recipeId);
    reviewsRecipe = ReviewsRecipeModel.fromJson(rawRecipe);
    return reviewsRecipe!;
  }

  Future<RecipeCreateReviewModel> fetchRecipeForCreateReview(int recipeId) async {
    var rawRecipe = await client.genericGetRequest<dynamic>('/recipes/create-review/$recipeId');
    return RecipeCreateReviewModel.fromJson(rawRecipe);
  }
}
