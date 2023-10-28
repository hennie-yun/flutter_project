import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SampleColor.dart';

Widget addTextWidget(String? str,
    {Color? color,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    int? maxLines,
    TextAlign align = TextAlign.left,
    TextDecoration decoration = TextDecoration.none,
    double? height}) {
  color ??= SampleColor.blue;
  if (str == null || str.isEmpty) {
    return Container();
  }

  return Text(
    str,
    maxLines: maxLines,
    textScaleFactor: 1.0,
    overflow: TextOverflow.ellipsis,
    textAlign: align,
    style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
        height: height),
  );
}
  Widget addButtonWidget ( String ? text,
{
  Color? bgColor,
Color? txtColor,
GestureTapCallback? callback,
String type = "confirm",
  double fontSize = 14,
  double? height = 50}) {
    bgColor ??= SampleColor.bgPrimary;
    txtColor ??= SampleColor.txtWhite;

    if (text == null || text.isEmpty) {
      return Container();
    }
    return Expanded(
        child: Container(
            height: height,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
              // border: Border.all(color: borderColor, width: borderWidth)),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              child: Center(
                child: addTextWidget(
                  text,
                  color: txtColor,
                  fontSize: fontSize,
                  align: TextAlign.center,
                ),
              ),
              onTap: () {
                callback?.call();
              },
            )
        ));
  }

