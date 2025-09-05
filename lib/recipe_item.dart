import 'package:flutter/material.dart';
import 'package:tapptitude/recipe.dart';
import 'package:tapptitude/recipe_screen.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;

  const RecipeItem({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return RecipeScreen(recipe: recipe);
              },
            ),
          );
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(4),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.grey[300],
                child: Icon(Icons.fastfood, size: 50, color: Colors.grey[600]),
              ),
            ),

            SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(recipe.duration),
                ],
              ),
            ),

            IconButton(
              icon: Icon(
                recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
