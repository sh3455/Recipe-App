import 'package:flutter/material.dart';
import 'package:recipe/color/color.dart';
import 'package:recipe/models/onboardingmodel.dart';

class OnboardingItem extends StatelessWidget {
   OnboardingItem({super.key,required this.onboardingModel});
  OnboardingModel onboardingModel;

  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.bodyColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(onboardingModel.image),
          Text(onboardingModel.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
          SizedBox(height: size.height*0.01,),
          Text(onboardingModel.text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey
            ),)
        ],
      ),
    );
  }
}
