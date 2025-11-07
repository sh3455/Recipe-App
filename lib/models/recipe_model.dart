class RecipeModel{
  String image;
  String recipeName;
  String recipe;
  String ingredients;
  String steps;

  RecipeModel({
    required this.image,
    required this.recipeName,
    required this.recipe,
    required this.ingredients,
    required this.steps});

  factory RecipeModel.fromJson(dynamic meal) {
    return RecipeModel(
      image: meal["strMealThumb"],
      recipeName: meal["strMeal"],
      recipe: meal["strInstructions"],
      ingredients: meal["strCategory"],
      steps: meal["strYoutube"],
    );
  }

  static List<RecipeModel> listFromJson(Map<String, dynamic> data) {
    if (data["meals"] == null) return [];
    var meals = data["meals"] as List;
    return meals.map((meal) => RecipeModel.fromJson(meal)).toList();
  }

  @override
  String toString() {
    // TODO: implement toString
    return "temp: ${recipe}";
  }


}


