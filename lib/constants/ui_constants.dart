//*--------------------------------------(svg-icon)
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

SizedBox svgIcon(
    {required double ht,
    required double wd,
    required String assetImage,
    required Color color}) {
  return SizedBox(
    height: ht,
    width: wd,
    child: SvgPicture.asset(
      assetImage,
      // ignore: deprecated_member_use
      color: color,
    ),
  );
}
