import 'package:flutter/material.dart';
import 'package:new_flutter/presentaion/login/login_view.dart';
import 'package:new_flutter/presentaion/main/main_view.dart';
import 'package:new_flutter/presentaion/register/register_view.dart';
import 'package:new_flutter/presentaion/resources/strings_manager.dart';
import 'package:new_flutter/presentaion/splash/splash_view.dart';
import 'package:new_flutter/presentaion/store_details/store_details_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgetPassword = "/forgetPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
  
    switch(settings.name){
    case Routes.splashRoute:
      return MaterialPageRoute(builder: (_)=>const SplashView());
    case Routes.loginRoute:
      return MaterialPageRoute(builder: (_)=>const LoginView());
    case Routes.registerRoute:
      return MaterialPageRoute(builder: (_)=>const RegisterView());
    case Routes.mainRoute:
      return MaterialPageRoute(builder: (_)=>const MainView());
    case Routes.storeDetailsRoute:
      return MaterialPageRoute(builder: (_)=>const StoreDetailsView());

    default:return  undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text(AppStrings.noRouteFound)),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
