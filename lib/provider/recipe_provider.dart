import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:recipe/models/recipe_model.dart';

class RecipeProvider extends ChangeNotifier{
  List<RecipeModel> recipeData =[];
  String? recipeName;

set RecipeData(List<RecipeModel> recipe){
  recipeData = recipe;
  notifyListeners();
}

List<RecipeModel> get RecipeData => recipeData;

  void setCityName(String name) {
    recipeName = name;
    notifyListeners();
  }

}
