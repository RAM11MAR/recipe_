import 'package:recipe/data/models/user_in_review_model.dart';

class ReviewModel {
  final int id;
  final String comment;
  final int rating;
  final UserInReviewModel user;
  final DateTime created;

  ReviewModel({
    required this.id,
    required this.comment,
    required this.rating,
    required this.user,
    required this.created,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      comment: json['comment'],
      rating: json['rating'],
      user: UserInReviewModel.fromJson(json['user']),
      created: DateTime.parse(json['created']),
    );
  }
}
