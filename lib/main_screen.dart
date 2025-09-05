import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:tapptitude/recipe.dart';
import 'package:tapptitude/recipe_search_result_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State {
  List<Recipe> _resultedRecipes = [];

  _fetchRecipes(String text) async {
    final res = await Gemini.instance.prompt(
      parts: [
        Part.text("Give me 3 or 4 recipes for the following dish:"),
        Part.text(text),
        Part.text(
          'Return them as json, each recipe having the following fields: String name, String duration, String ingredients, String instructions.',
        ),
      ],
    );

    final parsedString = res?.output
        ?.replaceAll('```', '')
        .replaceFirst('json', '');

    final json = jsonDecode(parsedString ?? '[]') as List<dynamic>;

    final recipes = json.map((e) => Recipe.fromJson(e)).toList();

    setState(() {
      _resultedRecipes = recipes;
    });
  }

  _handleSubmit(String text) {
    _fetchRecipes(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tapptitude")),
      body: Padding(
        padding: const EdgeInsets.all(8),
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

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Favorites",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 8),

            Expanded(
              child: _resultedRecipes.isEmpty
                  ? Center(child: Text("No recipes yet."))
                  : RecipeSearchResultList(recipes: _resultedRecipes),
            ),
          ],
        ),
      ),
    );
  }
}
