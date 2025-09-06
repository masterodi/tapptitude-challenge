import 'package:flutter/material.dart';
import 'package:tapptitude/recipes/recipe.dart';

class RecipesState {
  final List<Recipe> favoriteRecipes;

  RecipesState({this.favoriteRecipes = const []});

  RecipesState copyWith({List<Recipe>? favoriteRecipes}) {
    return RecipesState(
      favoriteRecipes: favoriteRecipes ?? this.favoriteRecipes,
    );
  }
}

class RecipesNotifier extends ValueNotifier<RecipesState> {
  RecipesNotifier(super.state);

  bool isFavorite(Recipe recipe) {
    return value.favoriteRecipes.any((r) => r.name == recipe.name);
  }

  void _addFavorite(Recipe recipe) {
    final updatedFavorites = [...value.favoriteRecipes, recipe];
    value = value.copyWith(favoriteRecipes: updatedFavorites);
  }

  void _removeFavorite(Recipe recipe) {
    final updatedFavorites = value.favoriteRecipes
      ..removeWhere((e) => e.name == recipe.name);
    value = value.copyWith(favoriteRecipes: updatedFavorites);
  }

  void toggleFavorite(Recipe recipe) {
    if (isFavorite(recipe)) {
      _removeFavorite(recipe);
    } else {
      _addFavorite(recipe);
    }
  }
}
