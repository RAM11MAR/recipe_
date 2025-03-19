import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/data/models/recipe/community_recipe_model.dart';
import 'package:recipe/data/repositories/recipe_repository.dart';

part 'community_state.dart';

class CommunityCubit extends Cubit<CommunityState> {
  CommunityCubit({required RecipeRepository recipeRepo})
      : _recipeRepo = recipeRepo,
        super(
          CommunityState(
            selectedIndex: 0,
            communityRecipes: [],
            status: CommunityStatus.loading,
          ),
        ) {
    load();
  }

  final RecipeRepository _recipeRepo;

  Future load() async {
    try {
      emit(state.copyWith(status: CommunityStatus.loading));
      final recipes = await _recipeRepo.fetchCommunityRecipes(orderBy: "rating", descending: true);
      emit(state.copyWith(status: CommunityStatus.idle, communityRecipes: recipes));
    } on Exception catch (e) {
      emit(state.copyWith(status: CommunityStatus.error, errorMessage: e.toString()));
    }
  }

  Future selectOrderBy(int index) async {
    emit(state.copyWith(status: CommunityStatus.loading, selectedIndex: index));
    final orderBy = switch (index) {
      0 => "rating",
      1 || 2 => "date",
      _ => "rating",
    };
    final descending = switch (index) {
      0 || 1 => true,
      2 => false,
      _ => true,
    };
    final recipes = await _recipeRepo.fetchCommunityRecipes(orderBy: orderBy, descending: descending);
    emit(state.copyWith(status: CommunityStatus.idle, communityRecipes: recipes));
  }
}
