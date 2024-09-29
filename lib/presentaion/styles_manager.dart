import 'package:flutter/material.dart';
import 'package:new_flutter/presentaion/font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      color: color,
      fontWeight: fontWeight);
}

// regular style

TextStyle getRegularTextStyle(
    {fontSize = FontSize.s12, required Color color, required}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

// medium style
TextStyle getMediumTextStyle({double fontSize=FontSize.s14,required FontWeight fontWeight, required Color color}){
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}
