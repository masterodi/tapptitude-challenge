import 'dart:convert';

import 'package:flutter_gemini/flutter_gemini.dart';

class Recipe {
  final String name;
  final String duration;
  final String ingredients;
  final String instructions;

  Recipe({
    required this.name,
    required this.duration,
    required this.ingredients,
    required this.instructions,
  });

  Recipe.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      duration = json['duration'],
      ingredients = json['ingredients'],
      instructions = json['instructions'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'duration': duration,
    'ingredients': ingredients,
    'instructions': instructions,
  };

  static Future<List<Recipe>> generateRecipes(String query) async {
    final res = await Gemini.instance.prompt(
      parts: [
        Part.text("Give me 3 or 4 recipes for the following dish:"),
        Part.text(query),
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

    return recipes;
  }
}
