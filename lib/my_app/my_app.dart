import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:subscription_test/entity/entity.dart';
import 'package:subscription_test/resources/resources.dart';
import 'package:subscription_test/ui/subscription_screen/subscription_screen.dart';
import 'package:subscription_test/ui/subscription_screen/subscription_screen_model.dart';
import 'package:subscription_test/ui/theme/theme.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SubscriptionScreenModelProvider(
        model: _model,
        child: const SubscriptionScreen(),
      ),
    );
  }
}

