class Recipe {
  final String name;
  final String duration;
  final String ingredients;
  final String instructions;
  bool isFavorite = false;

  Recipe({
    required this.name,
    required this.duration,
    required this.ingredients,
    required this.instructions,
    this.isFavorite = false,
  });

  Recipe.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      duration = json['duration'],
      ingredients = json['ingredients'],
      instructions = json['instructions'],
      isFavorite = json['isFavorite'] ?? false;

  Map<String, dynamic> toJson() => {
    'name': name,
    'duration': duration,
    'ingredients': ingredients,
    'instructions': instructions,
    'isFavorite': isFavorite,
  };
}
