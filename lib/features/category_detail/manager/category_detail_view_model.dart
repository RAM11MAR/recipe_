import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/data/models/category_model.dart';
import 'package:recipe/data/repositories/category_repository.dart';
import 'package:recipe/data/models/recipe/recipe_model.dart';
import 'package:recipe/data/repositories/recipe_repository.dart';

class CategoryDetailEvent {}

class CategoryDetailLoading extends CategoryDetailEvent {}

enum CategoryDetailStatus { idle, loading, error }

@immutable
class CategoryDetailState extends Equatable {
  const CategoryDetailState({
    required this.categories,
    required this.recipes,
    required this.right,
    required this.status,
    required this.selected,
  });

  final List<CategoryModel> categories;
  final List<RecipeModel> recipes;

  final bool right;

  final CategoryDetailStatus status;

  final CategoryModel? selected;

  @override
  List<Object?> get props => [categories, recipes, right, status, selected];

  // set selected(CategoryModel model) {
  //   if (categories.indexOf(_selected) < categories.indexOf(model)) {
  //     right = true;
  //   } else {
  //     right = false;
  //   }
  //   notifyListeners();
  //
  //   _selected = model;
  //   notifyListeners();
  //   fetchRecipesByCategory(_selected.id);
  // }
  //
  // Future<void> fetchRecipesByCategory(int categoryId) async {
  //   recipes = await _recipeRepo.fetchRecipesByCategory(categoryId);
  //   notifyListeners();
  // }
}

class CategoryDetailBloc extends Bloc<CategoryDetailEvent, CategoryDetailState> {
  CategoryDetailBloc({
    required CategoryRepository catRepo,
    required RecipeRepository recipeRepo,
    required int selectedId,
  })  : _catRepo = catRepo,
        _recipeRepo = recipeRepo,
        super(
          CategoryDetailState(
            categories: [],
            recipes: [],
            right: true,
            status: CategoryDetailStatus.loading,
            selected: null,
          ),
        ) {
    on<CategoryDetailLoading>(
      (event, emit) async {
        emit(
          CategoryDetailState(
            categories: [],
            recipes: [],
            right: true,
            status: CategoryDetailStatus.loading,
            selected: null,
          ),
        );
        final categories = await _catRepo.fetchCategories();

        emit(
          CategoryDetailState(
            categories: categories,
            recipes: await _recipeRepo.fetchRecipesByCategory(selectedId),
            right: true,
            status: CategoryDetailStatus.idle,
            selected: categories.singleWhere((category)=>category.id == selectedId),
          ),
        );
      },
    );

    add(CategoryDetailLoading());
  }

  final CategoryRepository _catRepo;
  final RecipeRepository _recipeRepo;
}


