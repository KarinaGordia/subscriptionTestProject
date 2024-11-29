import 'package:flutter/material.dart';
import 'package:subscription_test/ui/subscription_screen/subscription_screen.dart';
import 'package:subscription_test/ui/theme/theme.dart';
import 'package:subscription_test/ui/widgets/widgets.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.main,
      home: const InitialScreen(),
    );
  }
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const Positioned(
            top: 80,
            left: -199,
            child: BlurryCircle(
              width: 317,
              height: 359,
            ),
          ),
          const Positioned(
            top: 370,
            left: 221,
            child: BlurryCircle(
              width: 414,
              height: 359,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GradientButton(
                text: 'Подписка',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SubscriptionScreen(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
