import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:subscription_test/entity/entity.dart';
import 'package:subscription_test/resources/resources.dart';
import 'package:subscription_test/ui/subscription_screen/subscription_screen.dart';
import 'package:subscription_test/ui/subscription_screen/subscription_screen_model.dart';
import 'package:subscription_test/ui/theme/theme.dart';
import 'package:subscription_test/ui/widgets/gradient_button.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.main,
      home: const InitialScreen(),
    );
  }
}

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  final _model = SubscriptionScreenModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
      body: Stack(
        children: [
          const Positioned(
            top: 80,
            left: -199,
            child: const BlurCircle(
              width: 317,
              height: 359,
            ),
          ),
          const Positioned(
            top: 370,
            left: 221,
            child: const BlurCircle(
              width: 414,
              height: 359,
            ),
          ),
           Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GradientButton(text: 'Подписка', onPressed: () {},),
            ),
          ),
        ],
      ),
    );
  }
}

// SubscriptionScreenModelProvider(
//   model: _model,
//   child: const SubscriptionScreen(),
// ),

// Positioned(
//   top: 370,
//   left: 221,
//   child: const BlurCircle(
//     width: 414,
//     height: 359,
//   ),
// ),
// Positioned(
//   top: 80,
//   left: -199,
//   child: const BlurCircle(
//     width: 317,
//     height: 359,
//   ),
// ),

class BlurCircle extends StatelessWidget {
  const BlurCircle({super.key, required this.width, required this.height});

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
