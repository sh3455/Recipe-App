import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/provider/recipe_provider.dart';
import 'package:recipe/screens/home/home_screen.dart';
import 'package:recipe/screens/home/recipe_details_screen.dart';
import 'package:recipe/screens/onboarding/onboarding.dart';

void main(){
  runApp(ChangeNotifierProvider(
    create: (context){
      return RecipeProvider();
    },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: OnboardingScreen.routeName,
      routes: {
        OnboardingScreen.routeName:(context)=>OnboardingScreen(),
        HomeScreen.routeName:(context)=>HomeScreen(),


      },

    );
  }
}
