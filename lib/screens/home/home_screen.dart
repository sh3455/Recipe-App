import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/color/color.dart';
import 'package:recipe/models/recipe_model.dart';
import 'package:recipe/provider/recipe_provider.dart';
import 'package:recipe/screens/home/recipe_details_screen.dart';
import 'package:recipe/services/recipe_service.dart';
import 'package:expandable_page_view/expandable_page_view.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});
   static String routeName ="HomeScreen";


   @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? recipeName;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var recipeData = Provider.of<RecipeProvider>(context).recipeData;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.bodyColor,
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          AnimatedAlign(
            duration: Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            alignment:
            recipeData.isEmpty ? Alignment.center : Alignment.topCenter,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text("Recipe Finder",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: AppColor.mainColor
                      ),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (data) {
                          recipeName = data;
                        },
                        onSubmitted:(data)async{
                          recipeName = data;
                          RecipeServices service = RecipeServices();
                          List<RecipeModel> recipe =  (await service.getRecipe(recipeName: recipeName!)) as List<RecipeModel>;
                          final provider = Provider.of<RecipeProvider>(context, listen: false);
                          provider.setCityName(recipeName!);
                          provider.recipeData = recipe;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 35,horizontal: 20),

                          suffixIcon: GestureDetector(
                            onTap:() async{
                              FocusScope.of(context).unfocus();
                              RecipeServices service = RecipeServices();
                              List<RecipeModel> recipe =  (await service.getRecipe(recipeName: recipeName!)) as List<RecipeModel>;
                              final provider = Provider.of<RecipeProvider>(context, listen: false);
                              provider.setCityName(recipeName!);
                              provider.recipeData = recipe;
                            },

                              child: Icon(Icons.search,
                                color: AppColor.mainColor,)),
                          hintText: "Search Recipe",
                          hintStyle: TextStyle(
                            color: AppColor.mainColor
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColor.mainColor
                            )
                          )

                        ),

                      ),
                    ),

                    SizedBox(height: size.height*0.03,),
                    if(recipeData.isNotEmpty)
                      CarouselSlider.builder(
                        itemCount: recipeData.length,
                        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex){
                          final recipe = recipeData[itemIndex];
                          return SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.all(8),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(22)
                              ),
                              child: Column(
                                children: [
                                  Text(recipe.recipeName,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700
                                    ),),
                                  Image.network(recipe.image,
                                    width: size.width*0.6,
                                    height: size.height*0.4,
                                    fit: BoxFit.fill,
                                  ),
                                  Text(recipe.ingredients,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700
                                    ),),

                                  ElevatedButton(onPressed: (){
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => RecipeDetailsScreen(recipeModel: recipe),));
                                  },
                                      style: ButtonStyle(
                                          backgroundColor: WidgetStatePropertyAll(
                                              AppColor.mainColor)
                                      ),
                                      child: Text("View Recipe",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white
                                        ),)),
                                ],
                              ),
                            ),
                          );
                        },
                        options:CarouselOptions(
                          height:size.height*0.58,
                          enlargeCenterPage: true,
                          autoPlay: true


                        ) ,                ),












                ],
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
