import 'dart:io';

import 'package:recipe/core/client.dart';
import 'package:recipe/data/models/create_review_model.dart';
import 'package:recipe/data/models/recipe/review_model.dart';

class ReviewRepository {
  ReviewRepository({required this.client});

  final ApiClient client;

  Future<bool> createReview({
    required int recipeId,
    required int rating,
    required String comment,
    required bool recommend,
    File? photo,
  }) async {
    final reviewModel = CreateReviewModel(
      recipeId: recipeId,
      comment: comment,
      recommend: recommend,
      rating: rating,
      photo: photo,
    );
    final result = await client.createReview(reviewModel);
    return result;
  }

  Future<List<ReviewModel>> fetchReviewsByRecipe(int recipeId) async {
    final rawReviews = await client.genericGetRequest<List<dynamic>>('/reviews/list?recipeId=$recipeId');
    return rawReviews.map((review) => ReviewModel.fromJson(review)).toList();
  }
}
