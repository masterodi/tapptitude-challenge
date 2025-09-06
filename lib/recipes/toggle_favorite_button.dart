import 'package:flutter/material.dart';
import 'package:tapptitude/provider.dart';
import 'package:tapptitude/recipes/recipe.dart';
import 'package:tapptitude/recipes/recipes_notifier.dart';

class ToggleFavoriteButton extends StatelessWidget {
  final Recipe recipe;

  const ToggleFavoriteButton({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final recipesNotifier = Provider.of<RecipesNotifier>(context);

    return IconButton(
      icon: Icon(
        recipesNotifier.isFavorite(recipe)
            ? Icons.favorite
            : Icons.favorite_border,
      ),
      onPressed: () {
        recipesNotifier.toggleFavorite(recipe);
        if (recipesNotifier.isFavorite(recipe)) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${recipe.name} added to favorites'),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${recipe.name} removed from favorites'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
    );
  }
}
