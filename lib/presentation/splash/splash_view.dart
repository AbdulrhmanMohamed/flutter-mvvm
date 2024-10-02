import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_flutter/presentation/resources/assets_manager.dart';
import 'package:new_flutter/presentation/resources/color_manager.dart';
import 'package:new_flutter/presentation/resources/constants_manager.dart';
import 'package:new_flutter/presentation/resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
// any async should be destroyed when the screen disposed
Timer?_timer;
  @override
  void initState() {
    super.initState();
    _startDelay();
  }


_startDelay(){
  _timer= Timer(const Duration(seconds: ConstantsManager.splashDelay), goNext);
}
goNext()=>Navigator.pushReplacementNamed(context,Routes.onBoardingRoute);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(backgroundColor: ColorManager.primaryColor,),
        backgroundColor: ColorManager.primaryColor,
        body: const Center(
          child: Image(image: AssetImage(ImageAssets.splashlogo)),
        ));
  }
  @override
  void dispose() {
  _timer?.cancel();
    super.dispose();
  }
}
