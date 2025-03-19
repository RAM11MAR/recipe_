import 'user_model_in_recipe.dart';

class CommunityRecipeModel {
  final int id;
  final String title, description;
  final String image;
  final int timeRequired;
  final num rating;
  final int reviewsCount;
  final DateTime created;
  final UserModelInRecipe user;

  CommunityRecipeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.timeRequired,
    required this.rating,
    required this.reviewsCount,
    required this.created,
    required this.user,
  });

  factory CommunityRecipeModel.fromJson(Map<String, dynamic> json) {
    return CommunityRecipeModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['photo'],
      timeRequired: json['timeRequired'],
      rating: json['rating'],
      reviewsCount: json['reviewsCount'],
      created: DateTime.parse(json['created']),
      user: UserModelInRecipe.fromJson(json['user']),
    );
  }
}
