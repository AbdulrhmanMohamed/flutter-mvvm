import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_flutter/domain/models.dart';
import 'package:new_flutter/presentation/onboarding/viewmodel/onboardingviewmodel.dart';
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

  static final PageController _pageController = PageController();
  Onboardingviewmodel  _viewModel = Onboardingviewmodel();

  int _currentIndex = 0;

  void _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _bind();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _viewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _viewModel.outpuSliderViewObject,
        builder: (ctx, snapshot) {
          if (snapshot.data == null) {
            return Container();
          } else {
            final SliderViewObject sliderViewObject =
                snapshot.data as SliderViewObject;
            return Scaffold(
              backgroundColor: ColorManager.white,
              appBar: AppBar(
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: ColorManager.white,
                    statusBarBrightness: Brightness.dark),
              ),
              body: PageView.builder(
                  controller: _pageController,
                  itemCount: sliderViewObject.numOfSlides,
                  onPageChanged: (index) {
                    _viewModel.onPageChanged(index);
                  },
                  itemBuilder: (_, index) {
                    return OnBoardingPage(sliderViewObject.sliderObject);
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
                          Navigator.pushReplacementNamed(
                              context, Routes.loginRoute);
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
                      child: _getBottomSheetWidget(sliderViewObject),
                    )
                  ],
                ),
              ),
            );
          }
        });
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) {
  
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: GestureDetector(
          onTap: () {
            _pageController.animateToPage(_viewModel.goPrevious(),
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
          for (int i = 0; i < sliderViewObject.numOfSlides; i++)
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
            _pageController.animateToPage(_viewModel.gotNext(),
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
