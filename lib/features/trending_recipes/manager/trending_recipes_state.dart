import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


import '../../../data/models/recipe/recipe_model.dart';

enum TrendingRecipesStatus { idle, loading, error }

@immutable
class TrendingRecipesState extends Equatable {
  const TrendingRecipesState({
    required this.mostViewed,
    required this.status,
  });

  final RecipeModel? mostViewed;
  final TrendingRecipesStatus? status;

  TrendingRecipesState copyWith({
    RecipeModel? mostViewed,
    TrendingRecipesStatus? status,
  }) {
    return TrendingRecipesState(
      mostViewed: mostViewed ?? this.mostViewed,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [mostViewed,status];
}