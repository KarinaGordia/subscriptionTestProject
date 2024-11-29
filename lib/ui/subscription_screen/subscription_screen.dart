import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:subscription_test/entity/entity.dart';
import 'package:subscription_test/resources/resources.dart';
import 'package:subscription_test/ui/subscription_screen/subscription_screen_model.dart';
import 'package:subscription_test/ui/theme/theme.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          const _SubscriptionsSection(),
          const _AdditionalInfoRow(),
        ],
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
            backgroundColor: WidgetStatePropertyAll(AppColors.slateBlue10),
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

class _SubscriptionWidgetList extends StatefulWidget {
  const _SubscriptionWidgetList({super.key});

  @override
  State<_SubscriptionWidgetList> createState() =>
      _SubscriptionWidgetListState();
}

class _SubscriptionWidgetListState extends State<_SubscriptionWidgetList> {
  int? _value = 1;

  @override
  Widget build(BuildContext context) {
    final model = SubscriptionScreenModelProvider.watch(context)?.model;
    final subscriptions = model?.subscriptionInfo;

    if (subscriptions == null || subscriptions.isEmpty) {
      return const Text('No subscriptions available');
    }

    return Wrap(
      runSpacing: 25,
      children: List.generate(subscriptions.length, (int index) {
        return _SubscriptionOption(
          info: subscriptions[index],
          selected: _value == index,
          onSelected: (bool selected) {
            setState(() {
              _value = selected ? index : null;
            });
          },
        );
      }),
    );
  }
}

class _SubscriptionsSection extends StatelessWidget {
  const _SubscriptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _SubscriptionWidgetList(),
        SizedBox(
          height: 21,
        ),
        _GradientButton(),
      ],
    );
  }
}

class _SubscriptionOption extends StatelessWidget {
  const _SubscriptionOption({
    super.key,
    required this.info,
    required this.selected,
    this.onSelected,
  });

  final SubscriptionInfo info;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final selectionCircle = selected
        ? Container(
            height: 28,
            width: 28,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [AppColors.slateBlue, AppColors.lavenderGray]),
            ),
            child: SvgPicture.asset(
              Images.checkMark,
              fit: BoxFit.none,
            ),
          )
        : Container(
            height: 28,
            width: 28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: Colors.white),
            ),
          );

    final selectedDecoration = selected
        ? BoxDecoration(
            color: AppColors.black37,
            borderRadius: BorderRadius.circular(29),
            border: const GradientBoxBorder(
              gradient: LinearGradient(colors: [
                AppColors.white0,
                Colors.white,
              ]),
              width: 1,
            ),
          )
        : BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(29),
          );

    return Stack(
      alignment: Alignment.topRight,
      clipBehavior: Clip.none,
      children: [
        InkWell(
          onTap: () => onSelected?.call(!selected),
          borderRadius: BorderRadius.circular(29),
          child: Container(
            // duration: const Duration(milliseconds: 500),
            height: selected ? 272 : 131,
            decoration: selectedDecoration,
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
                      selectionCircle,
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
                              info.duration,
                              style: textTheme.bodyMedium,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              info.description,
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
                            info.price,
                            style: textTheme.bodyLarge,
                          ),
                          if (info.oldPrice != null)
                            Text(
                              info.oldPrice!,
                              style: textTheme.labelMedium?.copyWith(
                                color: AppColors.white46,
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 2,
                                decorationColor: AppColors.white46,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                if(selected)
                  const _ContentSection(
                  length: 5,
                ),
              ],
            ),
          ),
        ),
        if (info.profitableMark)
          Positioned(
            top: -15,
            right: -11,
            child: Container(
              width: 75,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Center(
                  child: Text(
                    'выгодно',
                    style:
                    textTheme.labelMedium?.copyWith(color: AppColors.slateBlue),
                  )),
            ),
          ),
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
