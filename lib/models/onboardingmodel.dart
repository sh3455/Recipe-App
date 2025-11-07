class OnboardingModel{
  String image;
  String title;
  String text;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.text});

 static List<OnboardingModel> onboardingModel=[

    OnboardingModel(
        image: "assets/images/onboarding.png",
        title: "Thousands of tested recipes",
        text: "There is no need to fear failure.\n"
            " Tested recipes are guaranteed to work by our professional chefs."),

   OnboardingModel(
       image: "assets/images/onboardingTwo.png",
       title: "Irresistible Flavor",
       text: "A delicious dish that combines authentic taste with  a unique flavor"
           " — an unforgettable experience for every food lover"),

   OnboardingModel(
       image: "assets/images/onboardingOne.png",
       title: "Moment of Enjoyment",
       text: "Capturing the joy of every bite \n"
           " — a taste so good, it brings a smile with every mouthful.")


  ];

}