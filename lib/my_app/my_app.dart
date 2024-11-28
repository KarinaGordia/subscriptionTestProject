import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:subscription_test/resources/resources.dart';
import 'package:subscription_test/ui/subscription_screen/subscription_screen.dart';
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

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                shadows: [
                  const Shadow(
                    offset: Offset(0, 4),
                    blurRadius: 12.0,
                    color: AppColors.white40,
                  ),
                ],
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const _AdditionalInfoTextButton(text: 'terms of use'),
        const _AdditionalInfoTextButton(text: 'policy privacy'),
        FilledButton(
          onPressed: () {},
          style: const ButtonStyle(
            backgroundColor:
                WidgetStatePropertyAll(AppColors.slateBlue10),
            padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(vertical: 10, horizontal: 16)),
          ),
          child: Text(
            'Restore purchase',
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: AppColors.white46),
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
        style: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: AppColors.white46),
      ),
    );
  }
}

class _SubscriptionOptionsSection extends StatelessWidget {
  const _SubscriptionOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 131,
          decoration: BoxDecoration(
            color: Colors.white10,
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
                const SizedBox(
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
                        style: textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Описание',
                        style: textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
                Text(
                  '1000р',
                  style: textTheme.bodyLarge,
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          height: 272,
          decoration: BoxDecoration(
            color: AppColors.black37,
            borderRadius: BorderRadius.circular(29),
            border: const GradientBoxBorder(
              gradient: LinearGradient(colors: [
                AppColors.white0, Colors.white,
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
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '6 месяцев',
                            style: textTheme.bodyMedium,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Описание',
                            style: textTheme.labelMedium,
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
                          style: textTheme.bodyLarge,
                        ),
                        Text(
                          '12 000р',
                          style: textTheme.labelMedium?.copyWith(
                            color: AppColors.white46,
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 2,
                            decorationColor: AppColors.white46,
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
        const SizedBox(
          height: 21,
        ),
        const _GradientButton(),
      ],
    );
  }
}

class _GradientButton extends StatelessWidget {
  const _GradientButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(29.0)),
        gradient: LinearGradient(
          colors: [
            AppColors.slateBlue,
            AppColors.lavenderGray,
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
          style: Theme.of(context).textTheme.displaySmall,
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
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(length, (int index) {
          return const _ContentLineItem();
        }),
      ),
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
      padding: const EdgeInsets.only(top: 14.0),
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
            style: Theme.of(context).textTheme.labelMedium,
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
