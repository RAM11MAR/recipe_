import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/data/models/category_model.dart';
import 'package:recipe/data/models/top_chef_model_small.dart';
import 'package:recipe/data/repositories/category_repository.dart';
import 'package:recipe/data/models/recipe/recipe_model.dart';
import 'package:recipe/data/repositories/chef_repository.dart';
import 'package:recipe/data/repositories/recipe_repository.dart';
import 'package:recipe/features/home/manager/home_events.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required CategoryRepository catRepo,
    required RecipeRepository recipeRepo,
    required ChefRepository chefRepo,
  })  : _catRepo = catRepo,
        _recipeRepo = recipeRepo,
        _chefRepo = chefRepo,
        super(
          HomeState(
            status: HomeStatus.loading,
            categories: [],
            yourRecipes: [],
            trendingRecipe: null,
            topChefs: [],
            recentlyAddedRecipes: [],
          ),
        ) {
    on<HomeLoad>(_onLoad);
    add(HomeLoad());
  }

  final CategoryRepository _catRepo;
  final RecipeRepository _recipeRepo;
  final ChefRepository _chefRepo;

  Future _onLoad(HomeLoad event, Emitter<HomeState> emit) async {
    emit(
      HomeState(
        status: HomeStatus.loading,
        categories: [],
        yourRecipes: [],
        trendingRecipe: null,
        topChefs: [],
        recentlyAddedRecipes: [],
      ),
    );
    emit(
      HomeState(
        status: HomeStatus.idle,
        categories: await _catRepo.fetchCategories(),
        yourRecipes: await _recipeRepo.fetchYourRecipes(limit: 2),
        trendingRecipe: await _recipeRepo.fetchTrendingRecipe(),
        topChefs: await _chefRepo.fetchTopChefsForHome(limit: 4),
        recentlyAddedRecipes: await _recipeRepo.fetchRecentlyAddedRecipes(limit: 2),
      ),
    );
  }
}
