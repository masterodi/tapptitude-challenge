import 'package:flutter/material.dart';
import 'package:tapptitude/provider.dart';
import 'package:tapptitude/recipes/recipe.dart';
import 'package:tapptitude/recipes/recipes_list.dart';
import 'package:tapptitude/recipes/recipes_notifier.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State {
  List<Recipe> _recipes = [];
  bool _hasText = false;
  bool _isLoading = false;
  String? aux;

  _handleSubmit(String text) async {
    aux = text;

    setState(() {
      _hasText = text.isNotEmpty;
    });

    if (text.isEmpty) {
      return;
    }

    setState(() {
      _recipes = [];
      _isLoading = true;
    });

    final recipes = await Recipe.generateRecipes(text);

    setState(() {
      _recipes = recipes;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tapptitude")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'What do you feel like eating?',
                prefixIcon: Icon(Icons.search),
              ),
              onSubmitted: _handleSubmit,
            ),

            SizedBox(height: 8),

            Expanded(
              child: _hasText
                  ? _SuggestedRecipes(
                      recipes: _recipes,
                      isLoading: _isLoading,
                      onRefresh: () => _handleSubmit(aux ?? ""),
                    )
                  : _FavoriteRecipes(),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoriteRecipes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recipesNotifier = Provider.of<RecipesNotifier>(context);

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Favorites",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),

        SizedBox(height: 8),

        recipesNotifier.value.favoriteRecipes.isEmpty
            ? Center(child: Text("No favorite recipes."))
            : Expanded(
                child: RecipesList(
                  recipes: recipesNotifier.value.favoriteRecipes,
                ),
              ),
      ],
    );
  }
}

class _SuggestedRecipes extends StatelessWidget {
  final List<Recipe> recipes;
  final bool isLoading;
  final void Function()? onRefresh;

  const _SuggestedRecipes({
    required this.recipes,
    this.isLoading = false,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Suggested Recipes",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),

        SizedBox(height: 8),

        if (isLoading)
          Expanded(child: Center(child: CircularProgressIndicator()))
        else if (recipes.isEmpty) ...[
          Center(child: Text("No suggested recipes.")),
          SizedBox(height: 8),
          ElevatedButton(onPressed: onRefresh, child: Text('Refresh')),
        ] else ...[
          Expanded(child: RecipesList(recipes: recipes)),
          SizedBox(height: 8),
          ElevatedButton(onPressed: onRefresh, child: Text('Refresh')),
        ],
      ],
    );
  }
}
