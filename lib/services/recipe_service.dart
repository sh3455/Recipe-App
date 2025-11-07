import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe/models/recipe_model.dart';

class RecipeServices{
Future<List<RecipeModel>>getRecipe({required String recipeName}) async{
  Uri url = Uri.parse("https://www.themealdb.com/api/json/v1/1/search.php?s=$recipeName");
  http.Response response = await http.get(url);
  Map<String,dynamic> data =jsonDecode(response.body);
 List<RecipeModel> recipe= RecipeModel.listFromJson(data);
 return recipe;

}
}