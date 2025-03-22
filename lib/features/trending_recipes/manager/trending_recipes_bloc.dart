import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/features/trending_recipes/manager/trending_recipes_events.dart';
import 'package:recipe/features/trending_recipes/manager/trending_recipes_state.dart';

import '../../../data/repositories/recipe_repository.dart';

class TrendingRecipesBloc extends Bloc<TrendingRecipesEvents, TrendingRecipesState> {
  TrendingRecipesBloc({required RecipeRepository recipeRepo})
      : _recipeRepo = recipeRepo,
        super(
        TrendingRecipesState(
          mostViewed: null,
          status: TrendingRecipesStatus.loading,
        ),
      ) {
    on<MostViewedLoad>(_onLoad);
    add(MostViewedLoad());
  }

  final RecipeRepository _recipeRepo;

  Future _onLoad(MostViewedLoad event, Emitter<TrendingRecipesState>emit) async{
    var mostViewed = await _recipeRepo.fetchTrendingRecipe();
    emit(state.copyWith(mostViewed: mostViewed, status: TrendingRecipesStatus.idle));
  }
}