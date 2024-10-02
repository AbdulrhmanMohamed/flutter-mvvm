import 'dart:async';

import 'package:new_flutter/domain/models.dart';
import 'package:new_flutter/presentation/base/baseviewmodel.dart';
import 'package:new_flutter/presentation/resources/assets_manager.dart';
import 'package:new_flutter/presentation/resources/strings_manager.dart';

class Onboardingviewmodel
    implements
        Baseviewmodel,
        OnBoardingViewModelInput,
        OnBoardingViewModelOutput {
  late final List<SliderObject> _list;
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  int _currentIndex = 0;

  @override
  void start() {
    _list = _getSliderdata();
    // set initial view slider page 1 at index 0
    _postToViewData();
  }
  @override
  void dispose() {
    _streamController.close();
  }


  @override
  int goPrevious() {
    int prevIndex = --_currentIndex;
  
      if (prevIndex < 0) {
        prevIndex = _list.length - 1;
      
    }
      return prevIndex;
  }

  @override
  int gotNext() {
     int index = ++_currentIndex;


      if (index > _list.length - 1) {
        index = 0;
      } 
    return index;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex=index;  
    _postToViewData();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

   @override
  Stream<SliderViewObject> get outpuSliderViewObject =>
      outpuSliderViewObject.map((sliderObject) => sliderObject);



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

  _postToViewData() {
    inputSliderViewObject.add(
        SliderViewObject(_list[_currentIndex], _currentIndex, _list.length));
  }

}

// actions that view make for the view model to return data
abstract class OnBoardingViewModelInput {
  int goPrevious();
  int gotNext();
  void onPageChanged(int index);

  // getter abstraction for StreamController input
  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutput {
//  getter abstraction for streamController output
  Stream<SliderViewObject> get outpuSliderViewObject;
}
