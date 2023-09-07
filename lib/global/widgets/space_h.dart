import 'package:flutter/material.dart';

import '../config/config.dart';

class SpaceH extends StatelessWidget {
  const SpaceH({
    super.key,
    required this.h,
  });
  final double h;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * h,
    );
  }
}
