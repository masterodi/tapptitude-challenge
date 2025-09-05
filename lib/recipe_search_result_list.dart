import 'package:flutter/material.dart';
import 'package:tapptitude/recipe.dart';
import 'package:tapptitude/recipe_item.dart';

class RecipeSearchResultList extends StatelessWidget {
  final List<Recipe> recipes;

  const RecipeSearchResultList({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 8),
      itemCount: recipes.length,
      itemBuilder: (ctx, index) {
        return RecipeItem(recipe: recipes[index]);
      },
    );
  }
}
