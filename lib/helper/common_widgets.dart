import 'package:flutter/material.dart';

SizedBox customSizedBox({double? height, double? width, Widget? child}){
  return SizedBox(
    height: height,
    width: width,
    child: child,
  );
}

Text customText({String? title, TextStyle? style}){
  return Text(
    title!,
    style: style,
  );
}

Container customContainer({
 double? height, 
 double? width, 
 AlignmentGeometry? alignment,
 Color? color, 
 BoxDecoration? decoration,
 Widget? child,
 EdgeInsetsGeometry? margin
 }){
  return Container(
    margin: margin,
    height: height,
    width: width,
    alignment: alignment,
    color: color,
    decoration: decoration,
    child: child,
  );
}

Row customRow({required List<Widget> children, MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,}){
  return Row(
    mainAxisAlignment: mainAxisAlignment,
    children: children,
  );
}

Column customColumn({required List<Widget> children, MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,}){
  return Column(
    mainAxisAlignment: mainAxisAlignment,
    children: children,
  );
}

Stack customStack({required List<Widget> children, AlignmentGeometry alignment = AlignmentDirectional.topStart}){
  return Stack(
    alignment: alignment,
    children: children,
  );
}

Dialog customDialog({Widget? child}){
  return Dialog(
    child: child,
  );
}

SingleChildScrollView customSingleChildScrollView({Widget? child}){
  return SingleChildScrollView(
    child: child,
  );
}