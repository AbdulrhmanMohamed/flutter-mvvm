import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_flutter/presentation/resources/assets_manager.dart';
import 'package:new_flutter/presentation/resources/color_manager.dart';
import 'package:new_flutter/presentation/resources/constants_manager.dart';
import 'package:new_flutter/presentation/resources/routes_manager.dart';
import 'package:new_flutter/presentation/resources/strings_manager.dart';
import 'package:new_flutter/presentation/resources/values_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
// late important for initializing from the return of a mehtod
// like _getSliderData
  late final List<SliderObject> _list = _getSliderdata();
  static final PageController _pageController = PageController();

  int _currentIndex = 0;
  List<SliderObject> _getSliderdata() {
    return [
      SliderObject(AppStrings.onBoardingtitle1, AppStrings.onBoardingSubtitle1,
          ImageAssets.onBoardingLogo1),
      SliderObject(AppStrings.onBoardingtitle2, AppStrings.onBoardingSubtitle2,
          ImageAssets.onBoardingLogo2),
      SliderObject(AppStrings.onBoardingtitle3, AppStrings.onBoardingSubtitle3,
          ImageAssets.onBoardingLogo3),
      SliderObject(AppStrings.onBoardingtitle4, AppStrings.onBoardingSubtitle4,
          ImageAssets.onBoardingLogo4),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark),
      ),
      body: PageView.builder(
          controller: _pageController,
          itemCount: _list.length,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemBuilder: (_, index) {
            return OnBoardingPage(_list[index]);
          }),
      bottomSheet: SizedBox(
        height: AppSize.s100,
        // color: ColorManager.darkGrey,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                },
                child: Text(
                  AppStrings.onBoardingSkip,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            Container(
              color: ColorManager.primaryColor,
              child: _getBottomSheetWidget(),
            )
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: GestureDetector(
          onTap: () {
            _pageController.animateToPage(_goPrevious(),
                duration:
                    const Duration(milliseconds: ConstantsManager.sliderDelay),
                curve: Curves.bounceInOut);
          },
          child: SizedBox(
            height: AppSize.s20,
            width: AppSize.s20,
            child: SvgPicture.asset(
              ImageAssets.leftArrow,
            ),
          ),
        ),
      ),
      Row(
        children: [
          for (int i = 0; i < _list.length; i++)
            Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: SizedBox(
                width: AppSize.s12,
                height: AppSize.s12,
                child: _getPropercircleIndecator(i),
              ),
            ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: GestureDetector(
          onTap: () {
            _pageController.animateToPage(_goNext(),
                duration:
                    const Duration(milliseconds: ConstantsManager.sliderDelay),
                curve: Curves.bounceInOut);
          },
          child: SizedBox(
            height: AppSize.s20,
            width: AppSize.s20,
            child: SvgPicture.asset(
              ImageAssets.rightArrow,
            ),
          ),
        ),
      ),
    ]);
  }

 int _goPrevious() {
    int prevIndex = --_currentIndex;
    setState(() {
      if (prevIndex < 0) {
        prevIndex = _list.length - 1;
      }
    });
      return prevIndex;
  }

 int _goNext() {

    int index = ++_currentIndex;

    setState(() {
      if (index > _list.length - 1) {
        index = 0;
      } 
    });
    return index;
  }

  Widget _getPropercircleIndecator(int index) {
    return _currentIndex == index
        ? SvgPicture.asset(ImageAssets.holloCircle)
        : SvgPicture.asset(ImageAssets.solidCircle);
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;
  const OnBoardingPage(this._sliderObject, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(_sliderObject.image),
      ],
    );
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}
