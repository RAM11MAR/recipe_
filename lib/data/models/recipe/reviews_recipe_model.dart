import 'package:recipe/data/models/recipe/user_model_in_recipe.dart';

class ReviewsRecipeModel {
  final int id;
  final String title;
  final String image;
  final int reviewsCount;
  final num rating;
  final UserModelInRecipe user;

  ReviewsRecipeModel({
    required this.id,
    required this.title,
    required this.image,
    required this.reviewsCount,
    required this.rating,
    required this.user,
  });

  factory ReviewsRecipeModel.fromJson(Map<String, dynamic> json) {
    return ReviewsRecipeModel(
      id: json['id'],
      title: json['title'],
      image: json['photo'],
      reviewsCount: json['reviewsCount'],
      rating: json['rating'],
      user: UserModelInRecipe.fromJson(json['user']),
    );
  }
}
