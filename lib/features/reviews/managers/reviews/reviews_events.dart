part of 'reviews_bloc.dart';

sealed class ReviewsEvents{}

final class ReviewsLoading extends ReviewsEvents{
  final int recipeId;
  ReviewsLoading({required this.recipeId});
}