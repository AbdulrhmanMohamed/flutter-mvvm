import 'package:flutter/material.dart';
import 'package:new_flutter/presentation/resources/font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      color: color,
      fontWeight: fontWeight);
}

// light style
TextStyle getLightTextStyle({double fontSize=FontSize.s12,required FontWeight fontWeight, required Color color}){
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}
// regular style

TextStyle getRegularTextStyle(
    {fontSize = FontSize.s14, required Color color, }) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

// medium style
TextStyle getMediumTextStyle({double fontSize=FontSize.s16, required Color color}){
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}
// semiBold style
TextStyle getSemiBoldTextStyle({double fontSize=FontSize.s18, required Color color}){
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}
// Bold style
TextStyle getBoldTextStyle({double fontSize=FontSize.s20, required Color color}){
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}
