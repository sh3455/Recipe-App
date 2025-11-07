import 'package:flutter/material.dart';
import 'package:recipe/color/color.dart';
import 'package:recipe/models/onboardingmodel.dart';
import 'package:recipe/screens/home/home_screen.dart';
import 'package:recipe/screens/onboarding/onboarding_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  static String routeName ="OnboardingScreen";

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var activeIndex =0;
  var controller = PageController();
  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.bodyColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index){
                  setState(() {
                    activeIndex=index;
                  });
                },
                controller: controller,
                itemCount: OnboardingModel.onboardingModel.length,
                  itemBuilder: (context, index) {
                    OnboardingModel onboardingModel = OnboardingModel.onboardingModel[index];
                    return OnboardingItem(onboardingModel: onboardingModel);
                  },),
            ),

            Center(
              child: SmoothPageIndicator(
                  controller: controller,  // PageController
                  count:  OnboardingModel.onboardingModel.length,
                  axisDirection: Axis.horizontal,
                  effect:  ExpandingDotsEffect(
                    dotWidth: 10,
                    dotHeight: 10,
                    activeDotColor: AppColor.mainColor,
                  ),  // your preferred effect
                  onDotClicked: (index){
                  }
              ),
            ),
            SizedBox(height: size.height*0.02,),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColor.mainColor),
              ),
              child: Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    color: AppColor.bodyColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
