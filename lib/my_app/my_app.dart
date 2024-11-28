import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:subscription_test/resources/resources.dart';
import 'package:subscription_test/ui/subscription_screen/subscription_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const InitialScreen(),
    );
  }
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final displaySmall = GoogleFonts.montserratAlternates(
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        height: 24 / 20,
        fontWeight: FontWeight.w500,
      ),
    );
    final bodyLarge = GoogleFonts.montserratAlternates(
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
        height: 19.5 / 16,
        fontWeight: FontWeight.w500,
      ),
    );
    final bodyMedium = GoogleFonts.montserratAlternates(
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 15,
        height: 18 / 15,
        fontWeight: FontWeight.w500,
      ),
    );
    final labelMedium = GoogleFonts.montserratAlternates(
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 12,
        height: 15 / 12,
        fontWeight: FontWeight.w500,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Выберите подписку',
              style: GoogleFonts.montserratAlternates(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  height: 24 / 20,
                  fontWeight: FontWeight.w500,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 4),
                      blurRadius: 12.0,
                      color: Color.fromRGBO(255, 255, 255, 0.4),
                    ),
                  ],
                ),
              ),
            ),
            const _SubscriptionOptionsSection(),
            const _AdditionalInfoRow(),
          ],
        ),
      ),
    );
  }
}

class _AdditionalInfoRow extends StatelessWidget {
  const _AdditionalInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.montserratAlternates(
      textStyle: const TextStyle(
        color: Color.fromRGBO(255, 255, 255, 0.46),
        fontSize: 12,
        height: 15 / 12,
        fontWeight: FontWeight.w500,
      ),
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const _AdditionalInfoTextButton(text: 'terms of use',),
        const _AdditionalInfoTextButton(text: 'policy privacy'),
        FilledButton(
          onPressed: () {},
          style: const ButtonStyle(
            backgroundColor:
                WidgetStatePropertyAll(Color.fromRGBO(107, 102, 216, 0.1)),
            padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 10, horizontal: 16)),
          ),
          child: Text(
            'Restore purchase',
            style: textStyle,
          ),
        ),
      ],
    );
  }
}

class _AdditionalInfoTextButton extends StatelessWidget {
  const _AdditionalInfoTextButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: const ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 5)),
        visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
      ),
      child: Text(
        text,
        style: GoogleFonts.montserratAlternates(
          textStyle: const TextStyle(
            color: Color.fromRGBO(255, 255, 255, 0.46),
            fontSize: 12,
            height: 15 / 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _SubscriptionOptionsSection extends StatelessWidget {
  const _SubscriptionOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final displaySmall = GoogleFonts.montserratAlternates(
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        height: 24 / 20,
        fontWeight: FontWeight.w500,
      ),
    );
    final bodyLarge = GoogleFonts.montserratAlternates(
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
        height: 19.5 / 16,
        fontWeight: FontWeight.w500,
      ),
    );
    final bodyMedium = GoogleFonts.montserratAlternates(
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 15,
        height: 18 / 15,
        fontWeight: FontWeight.w500,
      ),
    );
    final labelMedium = GoogleFonts.montserratAlternates(
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 12,
        height: 15 / 12,
        fontWeight: FontWeight.w500,
      ),
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 131,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 0.1),
            borderRadius: BorderRadius.circular(29),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Align(
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '1 месяц',
                        style: bodyMedium,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Описание',
                        style: labelMedium,
                      ),
                    ],
                  ),
                ),
                Text(
                  '1000р',
                  style: bodyLarge,
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 25,),
        Container(
          height: 272,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 0, 0.37),
            borderRadius: BorderRadius.circular(29),
            border: const GradientBoxBorder(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(255, 255, 255, 0),
                Color.fromRGBO(255, 255, 255, 1),
              ]),
              width: 1,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '6 месяцев',
                            style: bodyMedium,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Описание',
                            style: labelMedium,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '10 000р',
                          style: bodyLarge,
                        ),
                        Text(
                          '12 000р',
                          style: GoogleFonts.montserratAlternates(
                            textStyle: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.46),
                              fontSize: 12,
                              height: 15 / 12,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.lineThrough,
                              decorationThickness: 2,
                              decorationColor:
                                  Color.fromRGBO(255, 255, 255, 0.46),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const _ContentSection(
                length: 5,
              ),
            ],
          ),
        ),
        const SizedBox(height: 21,),
        _GradientButton(displaySmall: displaySmall),
      ],
    );
  }
}

class _GradientButton extends StatelessWidget {
  const _GradientButton({
    super.key,
    required this.displaySmall,
  });

  final TextStyle displaySmall;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(29.0)),
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(107, 102, 216, 1),
            Color.fromRGBO(186, 186, 215, 1),
          ],
        ),
        // borderRadius: BorderRadius.all(Radius.circular(80.0)),
      ),
      child: FilledButton(
        style: const ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(29.0),
              ),
            ),
          ),
          minimumSize: WidgetStatePropertyAll(
            Size(double.infinity, 60),
          ),
          backgroundColor: WidgetStatePropertyAll(Colors.transparent),
        ),
        onPressed: () {},
        child: Text(
          'Купить',
          style: displaySmall,
        ),
      ),
    );
  }
}

class _ContentSection extends StatelessWidget {
  const _ContentSection({super.key, required this.length});

  final int length;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(length, (int index) {
        return const _ContentLineItem();
      }),
    );
  }
}

class _ContentLineItem extends StatelessWidget {
  const _ContentLineItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: Row(
        children: [
          Container(
            height: 7,
            width: 7,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            'что входит',
            style: GoogleFonts.montserratAlternates(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                height: 15 / 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// Stack(
// children: [
// Positioned(
// top: 80,
// child: Image.asset(Images.ellipseTop),
// ),
// Positioned(
// right: 0,
// top: 370,
// child: Image.asset(Images.ellipseBottom),
// ),
// ],
// ),
