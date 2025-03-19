import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/data/repositories/recipe_repository.dart';
import 'package:recipe/data/repositories/review_repository.dart';

import 'reviews_state.dart';

part 'reviews_events.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  ReviewsBloc({
    required RecipeRepository recipeRepo,
    required ReviewRepository reviewRepo,
    required int recipeId,
  })  : _recipeRepo = recipeRepo,
        _reviewRepo = reviewRepo,
        super(
          ReviewsState(
            recipeModel: null,
            status: ReviewsStatus.loading,
            reviews: [],
          ),
        ) {
    on<ReviewsLoading>(_onLoad);
    add(ReviewsLoading(recipeId: recipeId));
  }

  final RecipeRepository _recipeRepo;
  final ReviewRepository _reviewRepo;

  Future<void> _onLoad(ReviewsLoading event, Emitter<ReviewsState> emit) async {
    emit(state.copyWith(status: ReviewsStatus.loading));
    final recipe = await _recipeRepo.fetchRecipeForReviews(event.recipeId);
    final reviews = await _reviewRepo.fetchReviewsByRecipe(event.recipeId);
    emit(state.copyWith(recipeModel: recipe, reviews: reviews, status: ReviewsStatus.idle));
  }
}
