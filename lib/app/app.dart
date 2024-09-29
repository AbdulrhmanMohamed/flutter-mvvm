import 'package:flutter/material.dart';
import 'package:new_flutter/presentation/resources/routes_manager.dart';
import 'package:new_flutter/presentation/resources/theme_manager.dart';

class MYApp extends StatefulWidget {
// named constructor to make the constructor private
  const MYApp._init();
// private instance from the named constructor

  static const _instance = MYApp._init();

  factory MYApp() => _instance;

  @override
  State<MYApp> createState() => _MYAppState();
}

class _MYAppState extends State<MYApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:getApplicationThemeData(),

      // this means invoke this function when need to handle new route 
      // this function should be returning new function
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,

    );
  }
}
