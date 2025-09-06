import 'package:flutter/material.dart';
import 'package:tapptitude/recipes/recipe.dart';
import 'package:tapptitude/recipes/recipe_item.dart';

class RecipesList extends StatelessWidget {
  final List<Recipe> recipes;

  const RecipesList({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 8),
      itemCount: recipes.length,
      itemBuilder: (ctx, index) {
        return RecipeItem(recipe: recipes[index]);
      },
      shrinkWrap: true,
    );
  }
}
