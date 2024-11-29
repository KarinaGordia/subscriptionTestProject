import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:subscription_test/ui/theme/theme.dart';

class BlurryCircle extends StatelessWidget {
  const BlurryCircle({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 50, tileMode: TileMode.decal),
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          color: AppColors.slateBlue,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}