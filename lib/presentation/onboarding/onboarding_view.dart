import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_flutter/presentation/resources/assets_manager.dart';
import 'package:new_flutter/presentation/resources/color_manager.dart';
import 'package:new_flutter/presentation/resources/strings_manager.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
// late important for initializing from the return of a mehtod
// like _getSliderData
  late final List<SliderObject> _list = _getSliderdata();
 static final PageController  _pageController=  PageController();
  List<SliderObject> _getSliderdata() {
    return [
      SliderObject(AppStrings.onBoardingtitle1, AppStrings.onBoardingSubtitle1,
          ImageAssets.onBoardingLogo1),
      SliderObject(AppStrings.onBoardingtitle2, AppStrings.onBoardingSubtitle2,
          ImageAssets.onBoardingLogo2),
      SliderObject(AppStrings.onBoardingtitle3, AppStrings.onBoardingSubtitle3,
          ImageAssets.onBoardingLogo3),
    ];
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: ColorManager.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark
        ),
      ),
      body:PageView() ,
    );
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}
