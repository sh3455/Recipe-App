import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/color/color.dart';
import 'package:recipe/models/recipe_model.dart';

import '../../provider/recipe_provider.dart';

class RecipeDetailsScreen extends StatelessWidget {
   RecipeDetailsScreen({super.key,required this.recipeModel});
  static String routeName ="RecipeScreen";
  RecipeModel recipeModel;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var recipeData = Provider.of<RecipeProvider>(context).recipeData;

    return Scaffold(
      backgroundColor: Color(0XFFF2E9E2),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: size.height*0.1,),
              Text(recipeModel.recipeName,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: AppColor.mainColor
                ),),
              Divider(
                indent: 10,
                endIndent: 10,
                thickness: 2,
                color: Colors.orange,
              ),
              Image.network(recipeModel.image),
              Container(
                alignment: Alignment.topLeft,
                child: Text("ingredients",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.orange
                  ),),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text(recipeModel.recipe,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700
                  ),),
              )


            ],
          ),
        ),
      ),
    );
  }
}
